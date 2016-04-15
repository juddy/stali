ROOT=../../..

include $(ROOT)/config.mk

BIN = ld-new
OBJS= ldmisc.o\
	eelf_x86_64.o\
	mri.o\
	ldgram.o\
	lexsup.o\
	ldlex-wrapper.o\
	ldemul.o\
	eelf32_x86_64.o\
	ldexp.o\
	ldlang.o\
	ldbuildid.o\
	ldver.o\
	ldcref.o\
	eelf_l1om.o\
	ei386linux.o\
	eelf_k1om.o\
	ldctor.o\
	ldmain.o\
	ldwrite.o\
	ldfile.o\
	eelf_i386.o
CLEAN_FILES = config.h eelf_x86_64.c ldemul-list.h eelf32_x86_64.c eelf_l1om.c ei386linux.c eelf_k1om.c eelf_i386.c
CPPFLAGS += -DLOCALEDIR=\"/share/locale\" -DTARGET=\"x86_64-pc-linux-musl\" -DTOOLBINDIR=\"/bin\"\
	    -DSCRIPTDIR=\"/share/scripts\" -DDEFAULT_EMULATION=\"elf_x86_64\" -DBINDIR=\"/bin\"
CFLAGS += -I. -I../include -I../bfd
LDFLAGS += ../bfd/libbfd.a ../libiberty/libiberty.a $(ROOT)/lib/zlib/libz.a

include $(ROOT)/mk/bin.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
