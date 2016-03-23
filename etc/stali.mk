ROOT=..

include $(ROOT)/config.mk

ETC = fstab.def\
	hosts.conf.def\
	rc.conf.def

include $(ROOT)/mk/etc.mk

clean:

