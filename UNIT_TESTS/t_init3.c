#include "t_assert.h"
#include "../plexlog.h"

int
main(void)
{
  struct plexlog px;

  test_assert(px_open(&px, "testdata/init3", 100, 0) == 1);
  test_assert(px_close(&px) == 1);
  return 0;
}
