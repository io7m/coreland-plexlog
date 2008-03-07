#include <err.h>

#include <corelib/buffer.h>
#include <corelib/dgetline.h>
#include <corelib/scan.h>

#include "t_assert.h"
#include "../plexlog.h"

int
main(int argc, char *argv[])
{
  struct plexlog px;
  struct dgetline dg;
  unsigned long max_file;
  unsigned long max_size;
  int flag_eof = 0;

  if (argc != 4) errx(2, "usage: dir max_file max_size");

  if (!scan_ulong(argv[2], &max_file)) errx(2, "max_file must be numeric");
  if (!scan_ulong(argv[3], &max_size)) errx(2, "max_size must be numeric");
  if (!dgetline_initbuf(&dg, buffer0)) err(2, "dgetline_init");

  if (!px_open(&px, argv[1])) err(2, "px_open");
  if (!px_max_files(&px, max_file)) err(2, "px_max_files");
  if (!px_max_filesize(&px, max_size)) err(2, "px_max_filesize");

  for (;;) {
    switch (dgetline_get(&dg)) {
      case 0: flag_eof = 1; break;
      case -1: err(2, "read");
      default: break;
    }
    if (flag_eof) break;
    if (!px_logb(&px, PXLOG_INFO, dgetline_data(&dg), dgetline_size(&dg)))
      err(2, "px_logb");
  }

  if (!px_close(&px)) err(2, "px_close");
  return 0;
}
