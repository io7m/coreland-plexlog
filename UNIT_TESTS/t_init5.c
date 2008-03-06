#include "t_assert.h"
#include "../plexlog.h"

int
main(void)
{
  struct plexlog px;

  test_assert(px_open(&px, "/nonexistent", 0, 0) == 0);
  test_assert(px_close(&px) == 1);
  return 0;
}
