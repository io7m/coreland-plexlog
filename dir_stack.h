#ifndef DIR_STACK_H
#define DIR_STACK_H

#include <corelib/sstack.h>

struct dir_stack {
  unsigned char sbuf[16 * sizeof(int)];
  struct sstack stack;
};

int dir_stack_init(struct dir_stack *);
int dir_stack_push(struct dir_stack *, const char *);
int dir_stack_pushfd(struct dir_stack *, int);
int dir_stack_pop(struct dir_stack *);
void dir_stack_popall(struct dir_stack *);

#endif
