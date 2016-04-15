ROOT=../../..

include $(ROOT)/config.mk

BIN = gas
OBJS= hash.o\
	output-file.o\
	input-scrub.o\
	flonum-mult.o\
	cond.o\
	as.o\
	ecoff.o\
	compress-debug.o\
	macro.o\
	config/atof-ieee.o\
	app.o\
	atof-generic.o\
	stabs.o\
	messages.o\
	write.o\
	remap.o\
	expr.o\
	sb.o\
	config/obj-elf.o\
	depend.o\
	config/tc-i386.o\
	input-file.o\
	symbols.o\
	dw2gencfi.o\
	literal.o\
	subsegs.o\
	ehopt.o\
	dwarf2dbg.o\
	flonum-copy.o\
	listing.o\
	read.o\
	frags.o\
	flonum-konst.o
CLEAN_FILES = config.h targ-env.h obj-format.h targ-cpu.h
CPPFLAGS +=  
CFLAGS += -I. -Iconfig -I../include -I../bfd -I.. -I$(ROOT)/lib/zlib
LDFLAGS += ../bfd/libbfd.a ../libiberty/libiberty.a ../opcodes/libopcodes.a $(ROOT)/lib/zlib/libz.a
include $(ROOT)/mk/bin.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
