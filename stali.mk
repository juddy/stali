ROOT=.

export STALISRC:=$(shell pwd)

include $(ROOT)/config.mk

SUBDIRS = etc\
	lib\
	bin\
	sys

#to be added after lib
#	comp\

world: all

include $(ROOT)/mk/dir.mk
