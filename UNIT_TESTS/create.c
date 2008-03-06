#include <sys/time.h>

#include <err.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char *argv[])
{
  struct timeval t[2];
  int fd;

  if (argc < 3) errx(2, "usage: file age");

  fd = open(argv[1], O_CREAT | O_TRUNC | O_WRONLY, 0644);
  if (fd == -1) err(2, "open");

  if (gettimeofday(&t[0], 0) == -1) err(2, "gettimeofday");
  
  t[0].tv_sec -= atoi(argv[2]);
  t[1] = t[0];

  if (futimes(fd, t) == -1) err(2, "futimes");
  if (close(fd) == -1) err(2, "close");
  return 0;
}
