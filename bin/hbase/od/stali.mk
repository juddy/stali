ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DSUS
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = od
OBJS = od.o

include $(ROOT)/mk/bin.mk

deps:
