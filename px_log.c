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
px_msg_total_len(enum plexlog_level lev, const char *txt, unsigned long len)
{
  static const unsigned long base_size = PX_FMT_TIMESTAMP + sizeof(" ")
    + FMT_ULONG + sizeof(": ") + sizeof(": ") + sizeof("\n");

  return base_size + str_len(px_level_string(lev))
                   + px_msg_filter_len(txt, len);
}

static int
px_log_write(struct plexlog *px, const char *tstamp, const char *levstr,
  const char *msg, unsigned long msglen)
{
  unsigned long ind;
  char cbuf[PX_FMT_CHAR];
  char cnum[FMT_ULONG];

  buffer_puts(&px->px_buf, tstamp);
  buffer_put(&px->px_buf, " ", 1);
  buffer_put(&px->px_buf, cnum, fmt_ulong(cnum, getpid()));
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
  char tstamp[PX_FMT_TIMESTAMP];
  unsigned long msglen;
  int ret = 0;

  msglen = px_msg_total_len(lev, txt, len);
  if (px->px_size_max && msglen > px->px_size_max) return 0;

  tstamp[px_fmt_timestamp(tstamp)] = 0;
  if (!px_lock(px)) goto END;
  if (px->px_size_max) {
    if (px->px_curstat.st_size + msglen > px->px_size_max)
      if (!px_rotate(px)) goto END;
  }
  if (!px_open_current(px)) goto END;
  if (!px_log_write(px, tstamp, px_level_string(lev), txt, len)) goto END;

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
