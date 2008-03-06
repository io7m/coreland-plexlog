#include <unistd.h>
#include <fcntl.h>
#include "fd_lock.h"

int
fd_lock_w(int fd)
{
  struct flock fl;

  fl.l_type = F_WRLCK;
  fl.l_whence = SEEK_SET;
  fl.l_start = 0;
  fl.l_len = 0;
  fl.l_pid = getpid();

  return fcntl(fd, F_SETLKW, &fl);
}

int
fd_unlock_w(int fd)
{
  struct flock fl;

  fl.l_type = F_UNLCK;
  fl.l_whence = SEEK_SET;
  fl.l_start = 0;
  fl.l_len = 0;
  fl.l_pid = getpid();

  return fcntl(fd, F_SETLKW, &fl);
}
