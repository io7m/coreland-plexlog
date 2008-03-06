#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <corelib/scan.h>
#include <corelib/sig.h>

#include "t_assert.h"

#define PLEXLOG_IMPLEMENTATION
#include "../plexlog.h"

struct plexlog px;
int id;

void
cleanup(void)
{
  printf("info: %d: try unlock\n", id);
  if (!px_unlock(&px))
    err(2, "fatal: %d: px_unlock", id);
  printf("info: %d: unlocked\n", id);
  printf("info: %d: try close\n", id);
  if (!px_close(&px))
    err(2, "fatal: %d: px_close", id);
  printf("info: %d: closed\n", id);
  exit(0);
}

void
catch_alarm(int s)
{
  printf("info: %d: alarm\n", id);
  cleanup();
}

int
main(int argc, char *argv[])
{
  char *file;
  unsigned int t_alarm;
  unsigned int t_wait;

  if (argc != 5)
    errx(2, "usage: t_alarm t_wait id, path");

  if (!scan_uint(argv[1], &t_alarm))
    errx(2, "fatal: t_alarm must be numeric");
  if (!scan_uint(argv[2], &t_wait))
    errx(2, "fatal: t_wait must be numeric");
  if (!scan_uint(argv[3], &id))
    errx(2, "fatal: id must be numeric");

  file = argv[4];

  sig_catch(sig_alarm, catch_alarm);

  printf("info: %d: try open\n", id);
  if (!px_open(&px, file, 100, 10))
    err(2, "fatal: %d: px_open", id);
  printf("info: %d: opened\n", id);

  alarm(t_alarm);

  printf("info: %d: try lock\n", id);
  if (!px_lock(&px))
    err(2, "fatal: %d: px_lock", id);
  printf("info: %d: locked\n", id);

  sleep(t_wait);
  alarm(0);
  cleanup();
  return 0;
}
