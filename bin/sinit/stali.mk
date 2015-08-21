ROOT=../..

include $(ROOT)/config.mk

OBJS = sinit.o
BIN = sinit

include $(ROOT)/mk/bin.mk

deps: config.h

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

