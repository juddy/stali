ROOT=../../..

include $(ROOT)/config.mk

all:

clean:
	$(MAKE) clean

install: all
	DESTDIR=$(DESTDIR) prefix=$(PREFIX) $(MAKE) install

uninstall:
	$(MAKE) uninstall

.PHONY: all clean install uninstall
