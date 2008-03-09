#include <unistd.h>

#include <corelib/buffer.h>
#include <corelib/dgetline.h>
#include <corelib/get_opt.h>
#include <corelib/scan.h>
#include <corelib/syserr.h>

#include "plexlog.h"

const char prog[] = "plexlog";
const char usage_s[] =
"usage: [-h] [-f file-max] [-s filesize-max] dir";
const char help_s[] =
"   -h: this message\n"
"   -f: maximum number of files (default: 10)\n"
"   -s: maximum log filesize (min: 4096, default: 99999, 0: unlimited)\n";

int
main(int argc, char *argv[])
{
  struct plexlog px;
  struct dgetline dg;
  unsigned long max_file;
  unsigned long max_size;
  int flag_eof = 0;
  int flag_file = 0;
  int flag_size = 0;
  int ch;

  if (argc < 2)
    syserr_die3x(111, prog, ": ", usage_s);

  while ((ch = get_opt(argc, argv, "hf:s:")) != opteof)
    switch (ch) {
      case 'h':
        syserr_die5x(111, prog, ": ", usage_s, "\n", help_s);
      case 'f':
        if (!scan_ulong(optarg, &max_file))
          syserr_die2x(112, prog, ": fatal: number of files must be numeric");
        flag_file = 1;
        break;
      case 's':
        if (!scan_ulong(optarg, &max_size))
          syserr_die2x(112, prog, ": fatal: filesize must be numeric");
        flag_size = 1;
        break;
      default:
        syserr_die3x(111, prog, ": ", usage_s);
    }
  argc -= optind;
  argv += optind;

  if (!argc) syserr_die3x(111, prog, ": ", usage_s);

  if (!dgetline_initbuf(&dg, buffer0))
    syserr_die2sys(112, prog, ": fatal: alloc: ");
  if (!px_open(&px, *argv))
    syserr_die2sys(112, prog, ": fatal: px_open: ");

  if (flag_size)
    if (!px_max_filesize(&px, max_size))
      syserr_die2sys(112, prog, ": fatal: px_max_filesize: ");
  if (flag_file)
    if (!px_max_files(&px, max_file))
      syserr_die2sys(112, prog, ": fatal: px_max_files: ");

  for (;;) {
    switch (dgetline_get(&dg)) {
      case -1:
        syserr_die2sys(112, prog, ": fatal: dgetline_get: ");
      case 0:
        flag_eof = 1;
      default:
        break;
    }
    if (flag_eof) break;
    for (;;) {
      if (!px_logb(&px, PXLOG_NONE, dgetline_data(&dg), dgetline_size(&dg))) {
        syserr_warn2sys(prog, ": error writing log - pausing: ");
        sleep(3);
      } else break;
    }
  }

  if (!px_close(&px))
    syserr_die2sys(112, prog, ": fatal: px_close: ");

  return 0;
}
