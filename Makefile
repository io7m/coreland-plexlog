# auto generated - do not edit

default: all

all:\
UNIT_TESTS/create UNIT_TESTS/lock UNIT_TESTS/log UNIT_TESTS/rotate \
UNIT_TESTS/t_fmt1 UNIT_TESTS/t_init1 UNIT_TESTS/t_init2 UNIT_TESTS/t_init3 \
UNIT_TESTS/t_init4 UNIT_TESTS/t_init5 UNIT_TESTS/t_lock1 UNIT_TESTS/t_lock2 \
UNIT_TESTS/write ctxt/ctxt.a deinstaller inst-check inst-copy inst-dir \
inst-link installer instchk plexlog-conf plexlog.a 

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

UNIT_TESTS/lock:\
cc-link UNIT_TESTS/lock.ld UNIT_TESTS/lock.o UNIT_TESTS/t_assert.o plexlog.a 
	./cc-link UNIT_TESTS/lock UNIT_TESTS/lock.o UNIT_TESTS/t_assert.o \
	plexlog.a 

UNIT_TESTS/lock.o:\
cc-compile UNIT_TESTS/lock.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/lock.c

UNIT_TESTS/log:\
cc-link UNIT_TESTS/log.ld UNIT_TESTS/log.o UNIT_TESTS/t_assert.o plexlog.a 
	./cc-link UNIT_TESTS/log UNIT_TESTS/log.o UNIT_TESTS/t_assert.o \
	plexlog.a 

UNIT_TESTS/log.o:\
cc-compile UNIT_TESTS/log.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/log.c

UNIT_TESTS/rotate:\
cc-link UNIT_TESTS/rotate.ld UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/rotate UNIT_TESTS/rotate.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/rotate.o:\
cc-compile UNIT_TESTS/rotate.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/rotate.c

UNIT_TESTS/t_assert.o:\
cc-compile UNIT_TESTS/t_assert.c UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/t_assert.c

UNIT_TESTS/t_fmt1:\
cc-link UNIT_TESTS/t_fmt1.ld UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_fmt1 UNIT_TESTS/t_fmt1.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_fmt1.o:\
cc-compile UNIT_TESTS/t_fmt1.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_fmt1.c

UNIT_TESTS/t_init1:\
cc-link UNIT_TESTS/t_init1.ld UNIT_TESTS/t_init1.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_init1.o:\
cc-compile UNIT_TESTS/t_init1.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_init1.c

UNIT_TESTS/t_init2:\
cc-link UNIT_TESTS/t_init2.ld UNIT_TESTS/t_init2.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_init2 UNIT_TESTS/t_init2.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_init2.o:\
cc-compile UNIT_TESTS/t_init2.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_init2.c

UNIT_TESTS/t_init3:\
cc-link UNIT_TESTS/t_init3.ld UNIT_TESTS/t_init3.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_init3 UNIT_TESTS/t_init3.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_init3.o:\
cc-compile UNIT_TESTS/t_init3.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_init3.c

UNIT_TESTS/t_init4:\
cc-link UNIT_TESTS/t_init4.ld UNIT_TESTS/t_init4.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_init4 UNIT_TESTS/t_init4.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_init4.o:\
cc-compile UNIT_TESTS/t_init4.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_init4.c

UNIT_TESTS/t_init5:\
cc-link UNIT_TESTS/t_init5.ld UNIT_TESTS/t_init5.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_init5 UNIT_TESTS/t_init5.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_init5.o:\
cc-compile UNIT_TESTS/t_init5.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_init5.c

UNIT_TESTS/t_lock1:\
cc-link UNIT_TESTS/t_lock1.ld UNIT_TESTS/t_lock1.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_lock1 UNIT_TESTS/t_lock1.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_lock1.o:\
cc-compile UNIT_TESTS/t_lock1.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_lock1.c

UNIT_TESTS/t_lock2:\
cc-link UNIT_TESTS/t_lock2.ld UNIT_TESTS/t_lock2.o UNIT_TESTS/t_assert.o \
plexlog.a 
	./cc-link UNIT_TESTS/t_lock2 UNIT_TESTS/t_lock2.o \
	UNIT_TESTS/t_assert.o plexlog.a 

UNIT_TESTS/t_lock2.o:\
cc-compile UNIT_TESTS/t_lock2.c UNIT_TESTS/t_assert.h plexlog.h 
	./cc-compile UNIT_TESTS/t_lock2.c

UNIT_TESTS/write:\
cc-link UNIT_TESTS/write.ld UNIT_TESTS/write.o 
	./cc-link UNIT_TESTS/write UNIT_TESTS/write.o 

UNIT_TESTS/write.o:\
cc-compile UNIT_TESTS/write.c 
	./cc-compile UNIT_TESTS/write.c

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags flags-chrono flags-integer \
flags-corelib 

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldflags libs-chrono-S libs-chrono-C \
libs-corelib-S libs-corelib-C libs-integer-S libs-integer-C 

cc-slib:\
conf-systype 

conf-cctype:\
conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-systype conf-ld conf-cctype mk-ldtype 
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix 
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp \
	conf-sosuffix

conf-systype:\
mk-systype 
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c 
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o 
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o \
	ctxt/repos.o ctxt/slibdir.o ctxt/version.o 

ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c 
	./cc-compile ctxt/dlibdir.c

ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c 
	./cc-compile ctxt/incdir.c

ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c 
	./cc-compile ctxt/repos.c

ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c 
	./cc-compile ctxt/slibdir.c

ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c 
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install_core.o \
install_error.o ctxt/ctxt.a 
	./cc-link deinstaller deinstaller.o insthier.o install_core.o \
	install_error.o ctxt/ctxt.a 

deinstaller.o:\
cc-compile deinstaller.c install.h 
	./cc-compile deinstaller.c

fd_lock.o:\
cc-compile fd_lock.c fd_lock.h 
	./cc-compile fd_lock.c

inst-check:\
cc-link inst-check.ld inst-check.o install_error.o 
	./cc-link inst-check inst-check.o install_error.o 

inst-check.o:\
cc-compile inst-check.c install.h 
	./cc-compile inst-check.c

inst-copy:\
cc-link inst-copy.ld inst-copy.o install_error.o 
	./cc-link inst-copy inst-copy.o install_error.o 

inst-copy.o:\
cc-compile inst-copy.c install.h 
	./cc-compile inst-copy.c

inst-dir:\
cc-link inst-dir.ld inst-dir.o install_error.o 
	./cc-link inst-dir inst-dir.o install_error.o 

inst-dir.o:\
cc-compile inst-dir.c install.h 
	./cc-compile inst-dir.c

inst-link:\
cc-link inst-link.ld inst-link.o install_error.o 
	./cc-link inst-link inst-link.o install_error.o 

inst-link.o:\
cc-compile inst-link.c install.h 
	./cc-compile inst-link.c

install_core.o:\
cc-compile install_core.c install.h 
	./cc-compile install_core.c

install_error.o:\
cc-compile install_error.c install.h 
	./cc-compile install_error.c

installer:\
cc-link installer.ld installer.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a 
	./cc-link installer installer.o insthier.o install_core.o \
	install_error.o ctxt/ctxt.a 

installer.o:\
cc-compile installer.c install.h 
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a 
	./cc-link instchk instchk.o insthier.o install_core.o \
	install_error.o ctxt/ctxt.a 

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
conf-cctype conf-systype 

mk-mk-ctxt:\
conf-cc 

mk-sosuffix:\
conf-systype 

mk-systype:\
conf-cc 

plexlog-conf:\
cc-link plexlog-conf.ld plexlog-conf.o ctxt/ctxt.a 
	./cc-link plexlog-conf plexlog-conf.o ctxt/ctxt.a 

plexlog-conf.o:\
cc-compile plexlog-conf.c ctxt.h _sysinfo.h 
	./cc-compile plexlog-conf.c

plexlog.a:\
cc-slib plexlog.sld px_close.o px_fmt.o px_level.o px_lock.o px_log.o \
px_open.o px_rotate.o fd_lock.o 
	./cc-slib plexlog px_close.o px_fmt.o px_level.o px_lock.o px_log.o \
	px_open.o px_rotate.o fd_lock.o 

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

clean-all: sysdeps_clean tests_clean obj_clean 
clean: obj_clean
obj_clean: 
	rm -f UNIT_TESTS/create UNIT_TESTS/create.o UNIT_TESTS/lock \
	UNIT_TESTS/lock.o UNIT_TESTS/log UNIT_TESTS/log.o UNIT_TESTS/rotate \
	UNIT_TESTS/rotate.o UNIT_TESTS/t_assert.o UNIT_TESTS/t_fmt1 \
	UNIT_TESTS/t_fmt1.o UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o \
	UNIT_TESTS/t_init2 UNIT_TESTS/t_init2.o UNIT_TESTS/t_init3 \
	UNIT_TESTS/t_init3.o UNIT_TESTS/t_init4 UNIT_TESTS/t_init4.o \
	UNIT_TESTS/t_init5 UNIT_TESTS/t_init5.o UNIT_TESTS/t_lock1 \
	UNIT_TESTS/t_lock1.o UNIT_TESTS/t_lock2 UNIT_TESTS/t_lock2.o \
	UNIT_TESTS/write UNIT_TESTS/write.o conf-cctype conf-ldtype \
	conf-systype ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.c \
	ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o ctxt/repos.c ctxt/repos.o \
	ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o \
	deinstaller deinstaller.o fd_lock.o inst-check inst-check.o \
	inst-copy inst-copy.o inst-dir inst-dir.o inst-link inst-link.o \
	install_core.o install_error.o installer installer.o instchk \
	instchk.o insthier.o mk-ctxt plexlog-conf plexlog-conf.o 
	rm -f plexlog.a px_close.o px_fmt.o px_level.o px_lock.o px_log.o \
	px_open.o px_rotate.o 

deinstall: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller
deinstall-dryrun: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller dryrun
install: installer inst-check inst-copy inst-dir inst-link postinstall
	./installer
	./postinstall

install-dryrun: installer inst-check inst-copy inst-dir inst-link
	./installer dryrun
install-check: instchk inst-check
	./instchk
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)
regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

