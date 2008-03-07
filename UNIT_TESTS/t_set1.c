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

  test_assert(px_max_files(&px, 0) == 1);
  test_assert(px_max_files(&px, 1) == 1);
  test_assert(px_max_files(&px, PX_FILE_DEFAULT) == 1);

  test_assert(px_max_filesize(&px, 0) == 1);
  test_assert(px_max_filesize(&px, 1) == 0);
  test_assert(px_max_filesize(&px, PX_SIZE_MIN) == 1);
  test_assert(px_max_filesize(&px, PX_SIZE_MIN - 1) == 0);
  test_assert(px_max_filesize(&px, PX_SIZE_DEFAULT) == 1);

  test_assert(px_close(&px) == 1);
  return 0;
}
