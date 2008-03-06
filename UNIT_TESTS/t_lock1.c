#include <unistd.h>

#include "t_assert.h"

#define PLEXLOG_IMPLEMENTATION
#include "../plexlog.h"

int
main(void)
{
  struct plexlog px;

  test_assert(px_open(&px, "testdata/lock1", 100, 10) == 1);

  test_assert(px_lock(&px) == 1);
  test_assert(px_unlock(&px) == 1);

  test_assert(px_lock(&px) == 1);
  test_assert(px_unlock(&px) == 1);

  test_assert(px_close(&px) == 1);
  return 0;
}
