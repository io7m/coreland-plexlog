#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "dir_stack.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "fd_lock.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "plexlog-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "plexlog.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_close.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_fmt.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_level.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_lock.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_log.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_open.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "px_rotate.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "dir_stack.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "dir_stack.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "fd_lock.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "fd_lock.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "plexlog.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "plexlog.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "plexlog.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "plexlog.a", "libplexlog.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "plexlog-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "plexlog-conf", 0, ctxt_bindir, 0, 0, 0755},
  {INST_COPY, "plexlog.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "plexlog", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
