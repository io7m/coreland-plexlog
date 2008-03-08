#include <unistd.h>

#include <corelib/fmt.h>
#include <corelib/str.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

static unsigned long
px_msg_filter_len(const char *txt, unsigned long txt_len)
{
  unsigned long pos;
  unsigned long len = 0;
  for (pos = 0; pos < txt_len; ++pos) len += px_fmt_char(0, txt[pos]);
  return len;
}

static int
px_log_put_base(struct plexlog *px, const char *ctai,
  const char *cpid, const char *levstr)
{
  buffer_puts(&px->px_buf, ctai); buffer_put(&px->px_buf, " ", 1);
  buffer_puts(&px->px_buf, cpid); buffer_put(&px->px_buf, " ", 1);

  if (*levstr) {
    buffer_puts(&px->px_buf, levstr);
    buffer_put(&px->px_buf, ": ", 2);
  }
  return 1;
}

/*
 * if max is nonzero, do not write more than max bytes to output.
 * the number of bytes in the string that have been processed are
 * returned in st.bytes_proc and the number of bytes written to the
 * output are returned in st.bytes_out.
 */

struct px_logstat {
  unsigned long bytes_proc;
  unsigned long bytes_out;
  int ok;
};

static struct px_logstat
px_log_put(struct plexlog *px, const char *msg, unsigned long len,
  unsigned long max)
{
  char cbuf[PX_FMT_CHAR];
  struct px_logstat st = {0,0,0};
  unsigned long pos;
  unsigned long blen;

  for (pos = 0; pos < len; ++pos) {
    blen = px_fmt_char(cbuf, msg[pos]);
    if (max && (st.bytes_out + blen >= max - 1)) break;
    buffer_put(&px->px_buf, cbuf, blen);
    st.bytes_proc++;
    st.bytes_out += blen;
  }

  buffer_put(&px->px_buf, "\n", 1);
  if (buffer_flush(&px->px_buf) != -1) st.ok = 1;
  return st;
}

static int
px_log_is_empty(struct plexlog *px)
{
  return (px->px_stat.st_size == 0);
}

static int
px_log_has_space(struct plexlog *px, unsigned long len)
{
  return (px->px_stat.st_size + len + PX_MSG_BASE_LEN < px->px_size_max);
}

/*
 * log with automatic file rotation.
 */

static int
px_log_with_rotate(struct plexlog *px, const char *ctai, const char *cpid,
  const char *levstr, const char *msg, unsigned long len)
{
  const unsigned long len_max = px->px_size_max - PX_MSG_BASE_LEN;
  unsigned long len_filt = px_msg_filter_len(msg, len);
  struct px_logstat st;

  if (!px_log_has_space(px, len_filt)) {
    if (!px_log_is_empty(px)) {
      if (!px_rotate(px)) return 0;
      if (!px_open_current(px)) return 0;
    }
    for (;;) {
      if (!px_log_has_space(px, len_filt)) {
        if (!px_log_put_base(px, ctai, cpid, levstr)) return 0;
        st = px_log_put(px, msg, len, len_max);
        if (!st.ok) return 0;
        msg += st.bytes_proc;
        len -= st.bytes_proc;
        len_filt = px_msg_filter_len(msg, len);
        if (!px_rotate(px)) return 0;
        if (!px_open_current(px)) return 0;
      } else
        break;
    }
  }

  if (len) {
    if (!px_log_put_base(px, ctai, cpid, levstr)) return 0;
    st = px_log_put(px, msg, len, 0);
    return st.ok;
  }
  return 1;
}

/*
 * public api
 */

int
px_logb(struct plexlog *px, enum plexlog_level lev,
  const char *txt, unsigned long len)
{
  char ctai[PX_FMT_TIMESTAMP];
  char cpid[FMT_ULONG];
  struct px_logstat st;
  const char *levstr;
  int ret = 0;

  ctai[px_fmt_timestamp(ctai)] = 0;
  cpid[fmt_ulong(cpid, getpid())] = 0;
  levstr = px_level_string(lev);

  if (!px_lock(px)) goto END;
  if (!px_open_current(px)) goto END;
  if (px->px_size_max) {
    if (!px_log_with_rotate(px, ctai, cpid, levstr, txt, len)) goto END;
  } else {
    if (!px_log_put_base(px, ctai, cpid, levstr)) goto END;
    st = px_log_put(px, txt, len, 0);
    if (!st.ok) goto END;
  }

  ret = 1;
  END:
  if (!px_unlock(px)) return 0;
  return ret; 
}

int
px_log(struct plexlog *px, enum plexlog_level lev, const char *txt)
{
  return px_logb(px, lev, txt, str_len(txt));
}
