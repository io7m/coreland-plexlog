#include <unistd.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

int
px_close(struct plexlog *px)
{
  if (px->px_dir) dealloc_null(&px->px_dir);
  if (px->px_fd_lock != -1) close(px->px_fd_lock);
  if (px->px_fd_pwd != -1) close(px->px_fd_pwd);
  if (px->px_fd_logdir != -1) close(px->px_fd_logdir);

  bin_zero(px, sizeof(*px));
  return 1;
}
