ROOT=../../..

include $(ROOT)/config.mk

LIB = libbfd.a
OBJS= aout32.o\
	archive64.o\
	archive.o\
	archures.o\
	bfdio.o\
	bfd.o\
	bfdwin.o\
	binary.o\
	cache.o\
	coffgen.o\
	cofflink.o\
	compress.o\
	corefile.o\
	cpu-i386.o\
	cpu-k1om.o\
	cpu-l1om.o\
	cpu-plugin.o\
	dwarf1.o\
	dwarf2.o\
	elf32-gen.o\
	elf32-i386.o\
	elf32.o\
	elf64-gen.o\
	elf64.o\
	elf64-x86-64.o\
	elf-attrs.o\
	elf-eh-frame.o\
	elf-ifunc.o\
	elflink.o\
	elf-nacl.o\
	elf.o\
	elf-strtab.o\
	elf-vxworks.o\
	format.o\
	hash.o\
	i386linux.o\
	ihex.o\
	init.o\
	libbfd.o\
	linker.o\
	merge.o\
	opncls.o\
	peigen.o\
	pei-i386.o\
	pei-x86_64.o\
	pex64igen.o\
	plugin.o\
	reloc.o\
	section.o\
	simple.o\
	srec.o\
	stabs.o\
	stab-syms.o\
	syms.o\
	targets.o\
	tekhex.o\
	verilog.o
CLEAN_FILES = config.h bfd.h bfdver.h bfd_stdint.h elf32-target.h elf64-target.h peigen.c pex64igen.c targmatch.h
CPPFLAGS += -DDEBUGDIR=\"/lib/debug\" -DBINDIR=\"/bin\" -DHAVE_x86_64_elf64_vec -DHAVE_i386_elf32_vec -DHAVE_x86_64_elf32_vec\
	    -DHAVE_i386_aout_linux_vec -DHAVE_i386_pei_vec -DHAVE_x86_64_pei_vec -DHAVE_l1om_elf64_vec -DHAVE_k1om_elf64_vec\
	    -DHAVE_elf64_le_vec -DHAVE_elf64_be_vec -DHAVE_elf32_le_vec -DHAVE_elf32_be_vec\
	    -DDEFAULT_VECTOR=x86_64_elf64_vec\
	    -DSELECT_VECS='&x86_64_elf64_vec,&i386_elf32_vec,&x86_64_elf32_vec,&i386_aout_linux_vec,&i386_pei_vec,&x86_64_pei_vec,&l1om_elf64_vec,&k1om_elf64_vec,&elf64_le_vec,&elf64_be_vec,&elf32_le_vec,&elf32_be_vec'\
	    -DSELECT_ARCHITECTURES='&bfd_i386_arch,&bfd_l1om_arch,&bfd_k1om_arch'
CFLAGS += -I. -I../include -I$(ROOT)/lib/zlib

include $(ROOT)/mk/lib.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
