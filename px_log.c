#include <unistd.h>

#include <corelib/fmt.h>
#include <corelib/str.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

static unsigned long
px_msg_filter_len(const char *txt, unsigned long txt_len)
{
  unsigned long ind;
  unsigned long len = 0;

  for (ind = 0; ind < txt_len; ++ind)
    len += px_fmt_char(0, txt[ind]);
  return len;
}

static unsigned long
px_msg_total_len(const char *levstr, const char *txt, unsigned long len)
{
  return PX_MSG_BASE_LEN + str_len(levstr) + px_msg_filter_len(txt, len);
}

static int
px_log_write(struct plexlog *px, const char *ctai, const char *pid,
  const char *levstr, const char *msg, unsigned long msglen)
{
  unsigned long ind;
  char cbuf[PX_FMT_CHAR];

  buffer_puts(&px->px_buf, ctai);
  buffer_put(&px->px_buf, " ", 1);
  buffer_puts(&px->px_buf, pid);
  buffer_put(&px->px_buf, " ", 1);

  if (!str_same(levstr, "")) {
    buffer_puts(&px->px_buf, levstr);
    buffer_put(&px->px_buf, ": ", 2);
  }

  for (ind = 0; ind < msglen; ++ind)
    buffer_put(&px->px_buf, cbuf, px_fmt_char(cbuf, msg[ind]));

  buffer_put(&px->px_buf, "\n", 1);
  if (buffer_flush(&px->px_buf) == -1) return 0;
  return 1;
}

int
px_logb(struct plexlog *px, enum plexlog_level lev,
  const char *txt, unsigned long len)
{
  char ctai[PX_FMT_TIMESTAMP];
  char cpid[FMT_ULONG];
  unsigned long msglen;
  const char *levstr;
  int ret = 0;

  levstr = px_level_string(lev);
  msglen = px_msg_total_len(levstr, txt, len);

  if (px->px_size_max && (msglen > px->px_size_max)) return 0;

  ctai[px_fmt_timestamp(ctai)] = 0;
  cpid[fmt_ulong(cpid, getpid())] = 0;

  if (!px_lock(px)) goto END;
  if (!px_open_current(px)) goto END;
  if (px->px_size_max) {
    if (px->px_curstat.st_size + msglen > px->px_size_max) {
      if (!px_rotate(px)) goto END;
      if (!px_open_current(px)) goto END;
    }
  }
  if (!px_log_write(px, ctai, cpid, levstr, txt, len)) goto END;

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
