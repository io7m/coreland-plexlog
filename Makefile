# auto generated - do not edit

default: all

all:\
UNIT_TESTS/create UNIT_TESTS/create.o UNIT_TESTS/lines UNIT_TESTS/lines.o \
UNIT_TESTS/lock UNIT_TESTS/lock.o UNIT_TESTS/log UNIT_TESTS/log.o \
UNIT_TESTS/rotate UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o UNIT_TESTS/t_fmt1 \
UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o UNIT_TESTS/t_init2 \
UNIT_TESTS/t_init2.o UNIT_TESTS/t_lock1 UNIT_TESTS/t_lock1.o UNIT_TESTS/t_lock2 \
UNIT_TESTS/t_lock2.o UNIT_TESTS/t_set1 UNIT_TESTS/t_set1.o UNIT_TESTS/write \
UNIT_TESTS/write.o ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.o ctxt/incdir.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o deinstaller deinstaller.o \
dir_stack.o fd_lock.o install-core.o install-error.o install-posix.o \
install-win32.o install.a installer installer.o instchk instchk.o insthier.o \
plexlog plexlog-conf plexlog-conf.o plexlog.a plexlog.o px_close.o px_fmt.o \
px_level.o px_lock.o px_log.o px_open.o px_rotate.o

# Mkf-deinstall
deinstall: deinstaller conf-sosuffix
	./deinstaller
deinstall-dryrun: deinstaller conf-sosuffix
	./deinstaller dryrun

# Mkf-install
install: installer postinstall conf-sosuffix
	./installer
	./postinstall

install-dryrun: installer conf-sosuffix
	./installer dryrun

# Mkf-instchk
install-check: instchk conf-sosuffix
	./instchk

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

# -- SYSDEPS start
flags-chrono:
	@echo SYSDEPS chrono-flags run create flags-chrono 
	@(cd SYSDEPS/modules/chrono-flags && ./run)
libs-chrono-S:
	@echo SYSDEPS chrono-libs-S run create libs-chrono-S 
	@(cd SYSDEPS/modules/chrono-libs-S && ./run)
flags-corelib:
	@echo SYSDEPS corelib-flags run create flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./run)
libs-corelib-S:
	@echo SYSDEPS corelib-libs-S run create libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./run)
flags-integer:
	@echo SYSDEPS integer-flags run create flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./run)
libs-integer-S:
	@echo SYSDEPS integer-libs-S run create libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./run)
_sysinfo.h:
	@echo SYSDEPS sysinfo run create _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./run)


chrono-flags_clean:
	@echo SYSDEPS chrono-flags clean flags-chrono 
	@(cd SYSDEPS/modules/chrono-flags && ./clean)
chrono-libs-S_clean:
	@echo SYSDEPS chrono-libs-S clean libs-chrono-S 
	@(cd SYSDEPS/modules/chrono-libs-S && ./clean)
corelib-flags_clean:
	@echo SYSDEPS corelib-flags clean flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./clean)
corelib-libs-S_clean:
	@echo SYSDEPS corelib-libs-S clean libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./clean)
integer-flags_clean:
	@echo SYSDEPS integer-flags clean flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./clean)
integer-libs-S_clean:
	@echo SYSDEPS integer-libs-S clean libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./clean)
sysinfo_clean:
	@echo SYSDEPS sysinfo clean _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./clean)


sysdeps_clean:\
chrono-flags_clean \
chrono-libs-S_clean \
corelib-flags_clean \
corelib-libs-S_clean \
integer-flags_clean \
integer-libs-S_clean \
sysinfo_clean \


# -- SYSDEPS end


UNIT_TESTS/create:\
cc-link UNIT_TESTS/create.ld UNIT_TESTS/create.o
	./cc-link UNIT_TESTS/create UNIT_TESTS/create.o

UNIT_TESTS/create.o:\
cc-compile UNIT_TESTS/create.c
	./cc-compile UNIT_TESTS/create.c

UNIT_TESTS/lines:\
cc-link UNIT_TESTS/lines.ld UNIT_TESTS/lines.o
	./cc-link UNIT_TESTS/lines UNIT_TESTS/lines.o

UNIT_TESTS/lines.o:\
cc-compile UNIT_TESTS/lines.c
	./cc-compile UNIT_TESTS/lines.c

UNIT_TESTS/lock:\
cc-link UNIT_TESTS/lock.ld UNIT_TESTS/lock.o UNIT_TESTS/t_assert.o plexlog.a
	./cc-link UNIT_TESTS/lock UNIT_TESTS/lock.o UNIT_TESTS/t_assert.o plexlog.a

UNIT_TESTS/lock.o:\
cc-compile UNIT_TESTS/lock.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/lock.c

UNIT_TESTS/log:\
cc-link UNIT_TESTS/log.ld UNIT_TESTS/log.o UNIT_TESTS/t_assert.o plexlog.a
	./cc-link UNIT_TESTS/log UNIT_TESTS/log.o UNIT_TESTS/t_assert.o plexlog.a

UNIT_TESTS/log.o:\
cc-compile UNIT_TESTS/log.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/log.c

UNIT_TESTS/rotate:\
cc-link UNIT_TESTS/rotate.ld UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/rotate UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o plexlog.a

UNIT_TESTS/rotate.o:\
cc-compile UNIT_TESTS/rotate.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/rotate.c

UNIT_TESTS/t_assert.o:\
cc-compile UNIT_TESTS/t_assert.c UNIT_TESTS/t_assert.h
	./cc-compile UNIT_TESTS/t_assert.c

UNIT_TESTS/t_fmt1:\
cc-link UNIT_TESTS/t_fmt1.ld UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_fmt1 UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_assert.o plexlog.a

UNIT_TESTS/t_fmt1.o:\
cc-compile UNIT_TESTS/t_fmt1.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_fmt1.c

UNIT_TESTS/t_init1:\
cc-link UNIT_TESTS/t_init1.ld UNIT_TESTS/t_init1.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o UNIT_TESTS/t_assert.o \
	plexlog.a

UNIT_TESTS/t_init1.o:\
cc-compile UNIT_TESTS/t_init1.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_init1.c

UNIT_TESTS/t_init2:\
cc-link UNIT_TESTS/t_init2.ld UNIT_TESTS/t_init2.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_init2 UNIT_TESTS/t_init2.o UNIT_TESTS/t_assert.o \
	plexlog.a

UNIT_TESTS/t_init2.o:\
cc-compile UNIT_TESTS/t_init2.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_init2.c

UNIT_TESTS/t_lock1:\
cc-link UNIT_TESTS/t_lock1.ld UNIT_TESTS/t_lock1.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_lock1 UNIT_TESTS/t_lock1.o UNIT_TESTS/t_assert.o \
	plexlog.a

UNIT_TESTS/t_lock1.o:\
cc-compile UNIT_TESTS/t_lock1.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_lock1.c

UNIT_TESTS/t_lock2:\
cc-link UNIT_TESTS/t_lock2.ld UNIT_TESTS/t_lock2.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_lock2 UNIT_TESTS/t_lock2.o UNIT_TESTS/t_assert.o \
	plexlog.a

UNIT_TESTS/t_lock2.o:\
cc-compile UNIT_TESTS/t_lock2.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_lock2.c

UNIT_TESTS/t_set1:\
cc-link UNIT_TESTS/t_set1.ld UNIT_TESTS/t_set1.o UNIT_TESTS/t_assert.o \
plexlog.a
	./cc-link UNIT_TESTS/t_set1 UNIT_TESTS/t_set1.o UNIT_TESTS/t_assert.o plexlog.a

UNIT_TESTS/t_set1.o:\
cc-compile UNIT_TESTS/t_set1.c UNIT_TESTS/t_assert.h plexlog.h
	./cc-compile UNIT_TESTS/t_set1.c

UNIT_TESTS/write:\
cc-link UNIT_TESTS/write.ld UNIT_TESTS/write.o
	./cc-link UNIT_TESTS/write UNIT_TESTS/write.o

UNIT_TESTS/write.o:\
cc-compile UNIT_TESTS/write.c
	./cc-compile UNIT_TESTS/write.c

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags conf-ccfflist flags-chrono \
	flags-integer flags-corelib

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldflags conf-ldfflist libs-chrono-S \
	libs-chrono-C libs-corelib-S libs-corelib-C libs-integer-S libs-integer-C

cc-slib:\
conf-systype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
	ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install.a ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install.a ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

dir_stack.o:\
cc-compile dir_stack.c dir_stack.h
	./cc-compile dir_stack.c

fd_lock.o:\
cc-compile fd_lock.c fd_lock.h
	./cc-compile fd_lock.c

install-core.o:\
cc-compile install-core.c install.h
	./cc-compile install-core.c

install-error.o:\
cc-compile install-error.c install.h
	./cc-compile install-error.c

install-posix.o:\
cc-compile install-posix.c install.h
	./cc-compile install-posix.c

install-win32.o:\
cc-compile install-win32.c install.h
	./cc-compile install-win32.c

install.a:\
cc-slib install.sld install-core.o install-posix.o install-win32.o \
install-error.o
	./cc-slib install install-core.o install-posix.o install-win32.o \
	install-error.o

install.h:\
install_os.h

installer:\
cc-link installer.ld installer.o insthier.o install.a ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install.a ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install.a ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install.a ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc conf-ld

plexlog:\
cc-link plexlog.ld plexlog.o plexlog.a
	./cc-link plexlog plexlog.o plexlog.a

plexlog-conf:\
cc-link plexlog-conf.ld plexlog-conf.o ctxt/ctxt.a
	./cc-link plexlog-conf plexlog-conf.o ctxt/ctxt.a

plexlog-conf.o:\
cc-compile plexlog-conf.c ctxt.h _sysinfo.h
	./cc-compile plexlog-conf.c

plexlog.a:\
cc-slib plexlog.sld px_close.o px_fmt.o px_level.o px_lock.o px_log.o px_open.o \
px_rotate.o fd_lock.o dir_stack.o
	./cc-slib plexlog px_close.o px_fmt.o px_level.o px_lock.o px_log.o px_open.o \
	px_rotate.o fd_lock.o dir_stack.o

plexlog.h:\
dir_stack.h

plexlog.o:\
cc-compile plexlog.c plexlog.h
	./cc-compile plexlog.c

px_close.o:\
cc-compile px_close.c plexlog.h
	./cc-compile px_close.c

px_fmt.o:\
cc-compile px_fmt.c plexlog.h
	./cc-compile px_fmt.c

px_level.o:\
cc-compile px_level.c plexlog.h
	./cc-compile px_level.c

px_lock.o:\
cc-compile px_lock.c plexlog.h fd_lock.h
	./cc-compile px_lock.c

px_log.o:\
cc-compile px_log.c plexlog.h
	./cc-compile px_log.c

px_open.o:\
cc-compile px_open.c plexlog.h
	./cc-compile px_open.c

px_rotate.o:\
cc-compile px_rotate.c plexlog.h
	./cc-compile px_rotate.c

clean-all: sysdeps_clean tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/create UNIT_TESTS/create.o UNIT_TESTS/lines UNIT_TESTS/lines.o \
	UNIT_TESTS/lock UNIT_TESTS/lock.o UNIT_TESTS/log UNIT_TESTS/log.o \
	UNIT_TESTS/rotate UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o UNIT_TESTS/t_fmt1 \
	UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o UNIT_TESTS/t_init2 \
	UNIT_TESTS/t_init2.o UNIT_TESTS/t_lock1 UNIT_TESTS/t_lock1.o UNIT_TESTS/t_lock2 \
	UNIT_TESTS/t_lock2.o UNIT_TESTS/t_set1 UNIT_TESTS/t_set1.o UNIT_TESTS/write \
	UNIT_TESTS/write.o ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.c \
	ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o ctxt/repos.c ctxt/repos.o \
	ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o deinstaller \
	deinstaller.o dir_stack.o fd_lock.o install-core.o install-error.o \
	install-posix.o install-win32.o install.a installer installer.o instchk \
	instchk.o insthier.o plexlog plexlog-conf plexlog-conf.o plexlog.a plexlog.o \
	px_close.o px_fmt.o px_level.o px_lock.o px_log.o px_open.o px_rotate.o
ext_clean:
	rm -f conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
