#include <unistd.h>
#include <fcntl.h>
#include <corelib/error.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"
#include "fd_lock.h"

int
px_lock(struct plexlog *px)
{
  int etmp;

  if (px->px_fd_lock != -1) return 0;

  px->px_fd_pwd = open(".", O_RDONLY);
  if (px->px_fd_pwd == -1) return 0;

  if (fchdir(px->px_fd_logdir) == -1) goto FAIL;

  px->px_fd_lock = open("lock", O_WRONLY | O_CREAT, 0644);
  if (px->px_fd_lock == -1) goto FAIL;
  if (fd_lock_w(px->px_fd_lock) == -1) goto FAIL;
  return 1;

  FAIL:
  etmp = errno; px_unlock(px); errno = etmp;
  return 0;
}

int
px_unlock(struct plexlog *px)
{
  if (px->px_fd_lock == -1) return 0;
  if (unlink("lock") == -1) return 0;
  if (fd_unlock_w(px->px_fd_lock) == -1) return 0;
  if (close(px->px_fd_lock) == -1) return 0;
  px->px_fd_lock = -1;
  if (fchdir(px->px_fd_pwd) == -1) return 0;
  if (close(px->px_fd_pwd) == -1) return 0;
  return 1;
}
