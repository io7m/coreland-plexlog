#include <chrono/taia.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

int
px_rotate(struct plexlog *px)
{
  char tstamp[TAIA_TAI64N + sizeof("@")];
  struct taia tai;

  taia_now(&tai);
  taia_tai64n(tstamp + 1, &tai);
  tstamp[TAIA_TAI64N - 1] = 0;

  return 0;
}
