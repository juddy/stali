ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DSU3 -DSHELL=\"/bin/sh\"
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = ed
OBJS = ed.o

include $(ROOT)/mk/bin.mk

deps:
