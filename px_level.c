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
  static const unsigned int strings_size = sizeof(strings) / sizeof(strings[0]);
  return (lev >= strings_size) ? strings[0].str : strings[lev].str;
}
