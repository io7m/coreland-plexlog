#include <unistd.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

int
px_close(struct plexlog *px)
{
  if (px->px_fd_lock != -1) close(px->px_fd_lock);
  if (px->px_fd_logdir != -1) close(px->px_fd_logdir);

  dir_stack_popall(&px->px_dirs);
  bin_zero(px, sizeof(*px));
  return 1;
}
