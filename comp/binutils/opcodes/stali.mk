ROOT=../../..

include $(ROOT)/config.mk

LIB = libopcodes.a
OBJS= i386-dis.o\
	disassemble.o\
	dis-init.o\
	dis-buf.o\
	i386-opc.o
CLEAN_FILES = config.h
CPPFLAGS += 
CFLAGS += -I. -I../include -I../bfd

include $(ROOT)/mk/lib.mk

deps: $(CLEAN_FILES)

%.h: %.stali
	cp $< $@

%.c: %.stalic
	cp $< $@
