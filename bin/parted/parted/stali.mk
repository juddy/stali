ROOT=../../..

include $(ROOT)/config.mk

BIN = parted
OBJS = parted.o\
	version.o\
	table.o\
	command.o\
	strlist.o\
	ui.o
CPPFLAGS += 
CFLAGS += -I. -I../lib -I../include
LDFLAGS += ../lib/libputil.a ../libparted/libparted.a

include $(ROOT)/mk/bin.mk

