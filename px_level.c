#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

const char *
px_level_string(enum plexlog_level lev)
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
