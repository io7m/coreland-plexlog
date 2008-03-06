# auto generated - do not edit

default: all

all:\
UNIT_TESTS/t_fmt1 UNIT_TESTS/t_init1 UNIT_TESTS/t_init2 UNIT_TESTS/t_init3 \
UNIT_TESTS/t_init4 UNIT_TESTS/t_init5 plexlog.a 

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


sysdeps_clean:\
chrono-flags_clean \
chrono-libs-S_clean \
corelib-flags_clean \
corelib-libs-S_clean \


# -- SYSDEPS end

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

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags flags-chrono flags-corelib 

cc-link:\
conf-ld conf-ldtype conf-systype libs-chrono-S libs-chrono-C libs-corelib-S \
libs-corelib-C 

cc-slib:\
conf-systype 

conf-cctype:\
conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-systype conf-ld conf-cctype mk-ldtype 
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-systype:\
mk-systype 
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

mk-cctype:\
conf-cc conf-systype 

mk-ctxt:\
mk-mk-ctxt 
	./mk-mk-ctxt

mk-ldtype:\
conf-cctype conf-systype 

mk-mk-ctxt:\
conf-cc 

mk-systype:\
conf-cc 

plexlog.a:\
cc-slib plexlog.sld px_close.o px_fmt.o px_log.o px_open.o 
	./cc-slib plexlog px_close.o px_fmt.o px_log.o px_open.o 

px_close.o:\
cc-compile px_close.c plexlog.h 
	./cc-compile px_close.c

px_fmt.o:\
cc-compile px_fmt.c plexlog.h 
	./cc-compile px_fmt.c

px_log.o:\
cc-compile px_log.c plexlog.h 
	./cc-compile px_log.c

px_open.o:\
cc-compile px_open.c plexlog.h 
	./cc-compile px_open.c

clean-all: sysdeps_clean obj_clean 
clean: obj_clean
obj_clean: 
	rm -f UNIT_TESTS/t_assert.o UNIT_TESTS/t_fmt1 UNIT_TESTS/t_fmt1.o \
	UNIT_TESTS/t_init1 UNIT_TESTS/t_init1.o UNIT_TESTS/t_init2 \
	UNIT_TESTS/t_init2.o UNIT_TESTS/t_init3 UNIT_TESTS/t_init3.o \
	UNIT_TESTS/t_init4 UNIT_TESTS/t_init4.o UNIT_TESTS/t_init5 \
	UNIT_TESTS/t_init5.o plexlog.a px_close.o px_fmt.o px_log.o \
	px_open.o 

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

