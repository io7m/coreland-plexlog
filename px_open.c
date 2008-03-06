#include <corelib/alloc.h>
#include <corelib/open.h>
#include <corelib/str.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

int
px_open(struct plexlog *px, const char *dir, unsigned long fmax,
  unsigned long smax)
{
  struct plexlog tmp;

  dir_array_init(&tmp.px_darray);
  if (!str_dup(dir, (char **) &tmp.px_dir)) return 0;

  tmp.px_dirfd = open_ro(dir);
  if (tmp.px_dirfd == -1) {
    dealloc_null(&tmp.px_dir);
    return 0;
  }

  tmp.px_size_max = smax;
  tmp.px_file_max = fmax;

  *px = tmp;
  return 1;
}
