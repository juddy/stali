ROOT=../../..

include $(ROOT)/config.mk

LIB = libiberty.a
OBJS= fdmatch.o\
	timeval-utils.o\
	argv.o\
	xatexit.o\
	strerror.o\
	xexit.o\
	concat.o\
	cp-demint.o\
	hashtab.o\
	alloca.o\
	xmalloc.o\
	stack-limit.o\
	xstrndup.o\
	cplus-dem.o\
	lrealpath.o\
	sha1.o\
	filename_cmp.o\
	pex-one.o\
	simple-object-xcoff.o\
	fnmatch.o\
	physmem.o\
	setproctitle.o\
	simple-object-elf.o\
	strsignal.o\
	fibheap.o\
	getpwd.o\
	choose-temp.o\
	getopt1.o\
	fopen_unlocked.o\
	pexecute.o\
	obstack.o\
	getopt.o\
	unlink-if-ordinary.o\
	xmemdup.o\
	lbasename.o\
	floatformat.o\
	simple-object-coff.o\
	sort.o\
	crc32.o\
	cp-demangle.o\
	regex.o\
	simple-object.o\
	dyn-string.o\
	splay-tree.o\
	xstrdup.o\
	dwarfnames.o\
	partition.o\
	make-temp-file.o\
	safe-ctype.o\
	pex-unix.o\
	md5.o\
	spaces.o\
	pex-common.o\
	hex.o\
	d-demangle.o\
	simple-object-mach-o.o\
	xstrerror.o\
	make-relative-prefix.o\
	getruntime.o\
	objalloc.o
CLEAN_FILES = config.h
CPPFLAGS += -DHAVE_CONFIG_H 
CFLAGS += -I. -I../include

include $(ROOT)/mk/lib.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
