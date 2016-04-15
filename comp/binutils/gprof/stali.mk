ROOT=../../..

include $(ROOT)/config.mk

BIN = gprof
OBJS= source.o\
	corefile.o\
	mips.o\
	utils.o\
	alpha.o\
	hertz.o\
	sparc.o\
	gmon_io.o\
	symtab.o\
	gprof.o\
	cg_dfn.o\
	call_graph.o\
	vax.o\
	cg_print.o\
	cg_arcs.o\
	hist.o\
	aarch64.o\
	i386.o\
	basic_blocks.o\
	tahoe.o\
	sym_ids.o\
	bsd_callg_bl.o\
	fsf_callg_bl.o\
	search_list.o\
	flat_bl.o
CLEAN_FILES = gconfig.h
CPPFLAGS +=  -DLOCALEDIR=\"/share/locale\"
CFLAGS += -I. -I../include -I../bfd
LDFLAGS += ../bfd/libbfd.a ../libiberty/libiberty.a $(ROOT)/lib/zlib/libz.a
include $(ROOT)/mk/bin.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
