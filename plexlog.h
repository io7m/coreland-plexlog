#ifndef PLEXLOG_H
#define PLEXLOG_H

#include <corelib/dir_array.h>

enum plexlog_level {
  PXLOG_NONE,
  PXLOG_DEBUG,
  PXLOG_INFO,
  PXLOG_NOTICE,
  PXLOG_WARN,
  PXLOG_ERROR,
  PXLOG_FATAL,
};

struct plexlog {
  unsigned long px_size_max;
  unsigned long px_file_max;
  int px_dirfd;
  const char *px_dir;
  struct dir_array px_darray;
};

int px_open(struct plexlog *, const char *, unsigned long, unsigned long);
int px_log(struct plexlog *, enum plexlog_level, const char *);
int px_logb(struct plexlog *, enum plexlog_level, const char *, unsigned long);
int px_close(struct plexlog *);

#if defined(PLEXLOG_IMPLEMENTATION)
#define PX_FMT_CHAR 8
unsigned int px_fmt_char(char *, unsigned int);
#endif

#endif
