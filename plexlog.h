#ifndef PLEXLOG_H
#define PLEXLOG_H

#include <sys/types.h>
#include <sys/stat.h>

#include <corelib/buffer.h>
#include <corelib/dir_array.h>

#include "dir_stack.h"

enum plexlog_level {
  PXLOG_NONE,
  PXLOG_DEBUG,
  PXLOG_INFO,
  PXLOG_NOTICE,
  PXLOG_WARN,
  PXLOG_ERROR,
  PXLOG_FATAL,
};

enum {
  PX_SIZE_DEFAULT = 99999,
  PX_SIZE_MIN = 4096,
  PX_FILE_DEFAULT = 10,
};

struct plexlog {
  unsigned long px_size_max;
  unsigned long px_file_max;
  int px_fd_logdir;
  int px_fd_lock;
  char px_cbuf[BUFFER_OUTSIZE];
  struct buffer px_buf;
  struct dir_array px_darray;
  struct stat px_stat;
  struct dir_stack px_dirs;
};

int px_open(struct plexlog *, const char *);
int px_max_files(struct plexlog *, unsigned long);
int px_max_filesize(struct plexlog *, unsigned long);
int px_log(struct plexlog *, enum plexlog_level, const char *);
int px_logb(struct plexlog *, enum plexlog_level, const char *, unsigned long);
int px_rotate(struct plexlog *);
int px_close(struct plexlog *);

#if defined(PLEXLOG_IMPLEMENTATION)

#define PX_FMT_CHAR 8
#define PX_FMT_TIMESTAMP 32

/* @4000000047d18117009557a4 20920 : \n */
#define PX_MSG_BASE_LEN (PX_FMT_TIMESTAMP + FMT_ULONG + 5)

#define px_unlocked(px) ((px)->px_fd_lock == -1)
#define px_locked(px) (!px_unlocked(px))
#define px_save_errno(px) ((px)->px_etmp = errno)
#define px_restore_errno(px) (errno = (px)->px_etmp)

unsigned int px_fmt_char(char *, unsigned int);
unsigned int px_fmt_timestamp(char *);

int px_lock(struct plexlog *);
int px_unlock(struct plexlog *);

int px_open_current(struct plexlog *);
const char *px_level_string(enum plexlog_level);
#endif

#endif
