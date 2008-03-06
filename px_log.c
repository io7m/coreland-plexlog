#include <chrono/taia.h>
#include <corelib/str.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

static const char *
px_lev_str(enum plexlog_level lev)
{
  static const struct {
    enum plexlog_level val;
    const char *str;
  } strings[] = {
    { PXLOG_NONE, "" },
    { PXLOG_DEBUG, "debug" },
    { PXLOG_INFO, "info" },
    { PXLOG_NOTICE, "notice" },
    { PXLOG_WARN, "warn" },
    { PXLOG_ERROR, "error" },
    { PXLOG_FATAL, "fatal" },
  };
  unsigned long ind;
  for (ind = 0; ind < sizeof(strings) / sizeof(strings[0]); ++ind)
    if (strings[ind].val == lev) return strings[ind].str;
  return strings[0].str;
}

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
  return (TAIA_TAI64N + sizeof("@ "))
        + str_len(px_lev_str(lev))
        + sizeof(": ")
        + px_msg_filter_len(txt, len)
        + sizeof("\n");
}

int
px_logb(struct plexlog *px, enum plexlog_level lev,
  const char *txt, unsigned long len)
{
  return px_msg_total_len(lev, txt, len);
}

int
px_log(struct plexlog *px, enum plexlog_level lev, const char *txt)
{
  return px_logb(px, lev, txt, str_len(txt));
}
