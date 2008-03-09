#include <unistd.h>
#include <corelib/close.h>
#include <corelib/error.h>
#include <corelib/open.h>
#include <corelib/sstack.h>
#include "dir_stack.h"

int
dir_stack_init(struct dir_stack *ds)
{
  sstack_init(&ds->stack, ds->sbuf, 1024, sizeof(int));
  return 1;
}

int
dir_stack_pushfd(struct dir_stack *ds, int fd)
{
  int pwdfd = -1;
  int es;
  void *vp;
  es = errno;
  pwdfd = open_ro(".");
  if (pwdfd == -1) return 0;
  if (!sstack_push(&ds->stack, &pwdfd)) { close(pwdfd); return 0; }
  if (fchdir(fd) == -1) { sstack_pop(&ds->stack, &vp); close(pwdfd); return 0; }
  errno = es;
  return 1;
}

int
dir_stack_push(struct dir_stack *ds, const char *dir)
{
  int es;
  int fd = open_ro(dir);
  if (fd == -1) return 0;
  if (!dir_stack_pushfd(ds, fd)) {
    es = errno; close(fd); errno = es;
    return 0;
  }
  return close(fd) != -1;
}

int
dir_stack_pop(struct dir_stack *ds)
{
  void *peek;
  int *pwdfd;
  int es = errno;
  if (!sstack_peek(&ds->stack, &peek)) return 0;
  pwdfd = (int *) peek;
  if (fchdir(*pwdfd) == -1) return 0;
  sstack_pop(&ds->stack, &peek);
  if (close(*pwdfd) == -1) return 0;
  errno = es;
  return 1;
}

void
dir_stack_popall(struct dir_stack *ds)
{
  while (sstack_size(&ds->stack)) dir_stack_pop(ds);
}
