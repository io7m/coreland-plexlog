#include <fcntl.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/error.h>
#include <corelib/fmt.h>
#include <corelib/open.h>
#include <corelib/str.h>
#include <corelib/write.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

int
px_max_files(struct plexlog *px, unsigned long max)
{
  px->px_file_max = max;
  return 1;
}

int
px_max_filesize(struct plexlog *px, unsigned long max)
{
  if (max && (max < PX_SIZE_MIN)) { errno = EINVAL; return 0; }
  px->px_size_max = max;
  return 1;
}

int
px_open(struct plexlog *px, const char *dir)
{
  int etmp;

  bin_zero(px, sizeof(*px));

  px->px_size_max = PX_SIZE_DEFAULT;
  px->px_file_max = PX_FILE_DEFAULT;

  px->px_fd_lock = -1;
  px->px_fd_logdir = open_ro(dir);
  if (px->px_fd_logdir == -1) goto FAIL;
  if (!dir_stack_init(&px->px_dirs)) goto FAIL;

  dir_array_init(&px->px_darray);
  buffer_init(&px->px_buf, (buffer_op) write, -1, px->px_cbuf, sizeof(px->px_cbuf));
  return 1;

  FAIL:
  etmp = errno; px_close(px); errno = etmp;
  return 0;
}

int
px_open_current(struct plexlog *px)
{
  if (px->px_buf.fd != -1)
    if (close(px->px_buf.fd) == -1) return 0;

  px->px_buf.fd = open_append("current");
  if (px->px_buf.fd == -1) return 0;

  if (fstat(px->px_buf.fd, &px->px_stat) == -1) {
    close(px->px_buf.fd);
    return 0;
  }
  return 1;
}
