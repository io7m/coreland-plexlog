#include <unistd.h>
#include <fcntl.h>
#include <corelib/error.h>
#include <corelib/open.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"
#include "fd_lock.h"

int
px_lock(struct plexlog *px)
{
  if (px_locked(px)) return 0;
  if (!dir_stack_pushfd(&px->px_dirs, px->px_fd_logdir)) return 0;
  px->px_fd_lock = open_creat("lock");
  if (px->px_fd_lock == -1) goto FAIL;
  if (fd_lock_w(px->px_fd_lock) == -1) goto FAIL;
  return 1;

  FAIL:
  px_unlock(px);
  return 0;
}

int
px_unlock(struct plexlog *px)
{
  int ret = 0;

  if (px_unlocked(px)) return 0;
  if (!dir_stack_pop(&px->px_dirs)) return 0;
  if (fd_unlock_w(px->px_fd_lock) == -1) goto END;
  if (close(px->px_fd_lock) == -1) goto END;

  ret = 1;
  END:
  px->px_fd_lock = -1;
  return ret;
}
