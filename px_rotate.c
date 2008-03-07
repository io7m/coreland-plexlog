#include <chrono/taia.h>
#include <stdio.h>
#include <unistd.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

static int
px_cmp_date(const char *a, const char *b, void *x)
{
  struct stat sba;
  struct stat sbb;

  if (stat(a, &sba) == -1) return 0;
  if (stat(b, &sbb) == -1) return 1;
  return (sba.st_birthtime - sbb.st_birthtime);
}

static int
px_filt_log(const char *fn, void *x)
{
  return fn[0] == '@';
}

static int
px_dir_rotate(struct plexlog *px)
{
  unsigned long dir_f;
  unsigned long max_f;
  char *name;
  int ret = 0;

  px->px_darray.cmp = px_cmp_date;
  px->px_darray.filter = px_filt_log;
  if (!dir_array_open(&px->px_darray, ".")) return 0;

  if (px->px_file_max) {
    dir_f = px->px_darray.n;
    max_f = px->px_file_max;
    for (;;) {
      if (max_f >= dir_f) break;
      if (!dir_array_next(&px->px_darray, &name)) goto END;
      if (unlink(name) == -1) goto END;
      --dir_f;
    }
  }

  ret = 1;
  END:
  dir_array_free(&px->px_darray);
  return ret;
}

int
px_rotate(struct plexlog *px)
{
  char tstamp[PX_FMT_TIMESTAMP];

  tstamp[px_fmt_timestamp(tstamp)] = 0;
  if (!px_dir_rotate(px)) return 0;
  if (rename("current", tstamp) == -1) return 0;
  return 1;
}
