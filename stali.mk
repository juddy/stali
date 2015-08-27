ROOT=.

export STALISRC:=$(shell pwd)

include $(ROOT)/config.mk

SUBDIRS = lib bin
#	sys

world: all

include $(ROOT)/mk/dir.mk
