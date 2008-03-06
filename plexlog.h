#ifndef PLEXLOG_H
#define PLEXLOG_H

#include <sys/types.h>
#include <sys/stat.h>

#include <corelib/buffer.h>
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
  int px_fd_logdir;
  int px_fd_pwd;
  int px_fd_lock;
  const char *px_dir;
  char px_cbuf[BUFFER_OUTSIZE];
  struct buffer px_buf;
  struct dir_array px_darray;
  struct stat px_curstat;
};

int px_open(struct plexlog *, const char *, unsigned long, unsigned long);
int px_log(struct plexlog *, enum plexlog_level, const char *);
int px_logb(struct plexlog *, enum plexlog_level, const char *, unsigned long);
int px_rotate(struct plexlog *);
int px_close(struct plexlog *);

#if defined(PLEXLOG_IMPLEMENTATION)
#define PX_FMT_CHAR 8
#define PX_FMT_TIMESTAMP 32
unsigned int px_fmt_char(char *, unsigned int);
int px_lock(struct plexlog *);
int px_unlock(struct plexlog *);
int px_open_current(struct plexlog *);
const char *px_level_string(enum plexlog_level);
unsigned int px_fmt_timestamp(char *);
#endif

#endif
