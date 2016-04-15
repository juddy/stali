ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I. -I../include -I../bfd -I$(ROOT)/lib/zlib
CPPFLAGS += -DOBJDUMP_PRIVATE_VECTORS="" -Dbin_dummy_emulation=bin_vanilla_emulation
LDFLAGS += ../bfd/libbfd.a ../libiberty/libiberty.a ../opcodes/libopcodes.a $(ROOT)/lib/zlib/libz.a
BUOBJS = bucomm.o version.o filemode.o
ELFOBJS = elfcomm.o
SIZE_OBJS = size.o $(BUOBJS)
OBJCOPY_OBJS = objcopy.o not-strip.o rename.o debug.o rddbg.o rdcoff.o ieee.o stabs.o wrstabs.o $(BUOBJS)
STRINGS_OBJS = strings.o $(BUOBJS)
READELF_OBJS = readelf.o version.o unwind-ia64.o dwarf.o $(ELFOBJS)
ELFEDIT_OBJS = elfedit.o version.o $(ELFOBJS)
STRIP_NEW_OBJS = objcopy.o is-strip.o rename.o debug.o rddbg.o rdcoff.o ieee.o stabs.o wrstabs.o $(BUOBJS)
NM_NEW_OBJS = nm.o $(BUOBJS)
OBJDUMP_OBJS = objdump.o dwarf.o prdbg.o debug.o rddbg.o rdcoff.o ieee.o stabs.o wrstabs.o $(BUOBJS) $(ELFOBJS)
CXXFILT_OBJS = cxxfilt.o $(BUOBJS)
AR_OBJS = arparse.o arlex.o ar.o not-ranlib.o arsup.o rename.o binemul.o emul_vanilla.o $(BUOBJS)
RANLIB_OBJS = ar.o is-ranlib.o arparse.o arlex.o arsup.o rename.o binemul.o emul_vanilla.o $(BUOBJS)
ADDR2LINE_OBJS = addr2line.o $(BUOBJS)
OBJS = $(BUOBJS) $(ELFOBJS) $(SIZE_OBJS) $(OBJCOPY_OBJS) $(STRINGS_OBJS) $(READELF_OBJS)\
       $(ELFEDIT_OBJS) $(STRIP_NEW_OBJS) $(NM_NEW_OBJS) $(OBJDUMP_OBJS) $(CXXFILT_OBJS)\
       $(AR_OBJS) $(RANLIB_OBJS) $(ADDR2LINE_OBJS)

BIN = strings\
	ranlib\
	objcopy\
	nm-new\
	objdump\
	cxxfilt\
	ar\
	size\
	elfedit\
	readelf\
	addr2line\
	strip-new
CLEAN_FILES = config.h

all: options deps $(BIN)

options:
	@echo $(BIN) build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@

strings: $(STRINGS_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(STRINGS_OBJS) $(LDFLAGS)

ranlib: $(RANLIB_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(RANLIB_OBJS) $(LDFLAGS)

objcopy: $(OBJCOPY_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(OBJCOPY_OBJS) $(LDFLAGS)

nm-new: $(NM_NEW_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(NM_NEW_OBJS) $(LDFLAGS)

objdump: $(OBJDUMP_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(OBJDUMP_OBJS) $(LDFLAGS)

cxxfilt: $(CXXFILT_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(CXXFILT_OBJS) $(LDFLAGS)

ar: $(AR_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(AR_OBJS) $(LDFLAGS)

size: $(SIZE_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(SIZE_OBJS) $(LDFLAGS)

elfedit: $(ELFEDIT_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(ELFEDIT_OBJS) $(LDFLAGS)

readelf: $(READELF_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(READELF_OBJS) $(LDFLAGS)

addr2line: $(ADDR2LINE_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(ADDR2LINE_OBJS) $(LDFLAGS)

strip-new: $(STRIP_NEW_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(STRIP_NEW_OBJS) $(LDFLAGS)

clean:
	@echo cleaning
	@rm -f $(BIN) $(OBJS) $(CLEAN_FILES)

install: all
	@echo installing executable file to $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)
	@cd templates && $(MAKE) prefix=$(DESTDIR)$(PREFIX) install

uninstall:
	@echo removing executable file from $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN)

.PHONY: deps options clean install uninstall
