#include <chrono/taia.h>
#include <corelib/bin.h>
#include <corelib/fmt.h>
#include <corelib/str.h>

#define PLEXLOG_IMPLEMENTATION
#include "plexlog.h"

unsigned int
px_fmt_char(char *ptr, unsigned int ch)
{
  unsigned int ch_low = 0x1f;
  unsigned int ch_high = 0x7f;

  if (ch <= ch_low || ch >= ch_high) {
    if (ptr) {
      ptr[0] = '\\';
      ptr[1] = 'x';
      ptr += 2;
    }
    return fmt_ucharx(ptr, ch) + 2;
  }

  if (ch == '\\') {
    if (ptr) {
      ptr[0] = '\\';
      ptr[1] = '\\';
    }
    return 2;
  }

  if (ptr) {
    ptr[0] = (char) ch;
  }
  return 1;
}

unsigned int
px_fmt_timestamp(char *ptr)
{
  struct taia tai;

  if (ptr) {
    taia_now(&tai);
    taia_tai64n(ptr + 1, &tai);
    ptr[0] = '@';
  }
  return TAIA_TAI64N;
}
