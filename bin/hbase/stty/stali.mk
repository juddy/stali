ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DUCB
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = stty
OBJS = stty.o

include $(ROOT)/mk/bin.mk

deps:
