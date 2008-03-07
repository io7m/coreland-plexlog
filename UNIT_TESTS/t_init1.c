#include <unistd.h>

#include "t_assert.h"
#include "../plexlog.h"

int
main(void)
{
  struct plexlog px;

  rmdir("testdata/init");
  mkdir("testdata/init", 0755);

  test_assert(px_open(&px, "testdata/init") == 1);
  test_assert(px_close(&px) == 1);
  return 0;
}
