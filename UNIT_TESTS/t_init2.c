#include <corelib/error.h>

#include "t_assert.h"
#include "../plexlog.h"

int
main(void)
{
  struct plexlog px;

  test_assert(px_open(&px, "/nonexistent") == 0);
  test_assert(errno == error_noent);
  return 0;
}
