ROOT=../..

include $(ROOT)/config.mk

CFLAGS = -I./
CPPFLAGS = -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1  -DTERMCAP_FILE=\"/etc/termcap\" 
LIB = libtermcap.a
OBJS = termcap.o tparam.o version.o
CLEAN_FILES = 

include $(ROOT)/mk/lib.mk

postinst:
	@mkdir -p $(DESTDIR)$(PREFIX)/etc
	@cp -f termcap.src $(DESTDIR)$(PREFIX)/etc/termcap
	@chmod 644 $(DESTDIR)$(PREFIX)/etc/termcap
	@mkdir -p $(DESTDIR)$(PREFIX)/share/info
	@cp -f termcap.info* $(DESTDIR)$(PREFIX)/share/info
	@cd $(DESTDIR)$(PREFIX)/share/info && chmod 644 termcap.info*

postuninst:
	@cd $(DESTDIR)$(PREFIX)/etc/ && rm -f termcap
	@cd $(DESTDIR)$(PREFIX)/share/info && rm -f termcap.info*
