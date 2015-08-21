ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DSU3
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = grep
OBJS = alloc.o grep.o grid.o plist.o rcomp.o sus.o ac.o

include $(ROOT)/mk/bin.mk

deps:

grep.o: grep.h config.h alloc.h
plist.o: grep.h config.h alloc.h
sus.o: grep.h config.h alloc.h
ac.o: alloc.h grep.h
rcomp.o: grep.h config.h alloc.h

postinst:
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf $(BIN) egrep
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf $(BIN) fgrep
	@sed "s/VERSION/$(VERSION)/g" < egrep.1 > $(DESTDIR)$(MANPREFIX)/man1/egrep.1
	@sed "s/VERSION/$(VERSION)/g" < fgrep.1 > $(DESTDIR)$(MANPREFIX)/man1/fgrep.1

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/egrep
	@rm -f $(DESTDIR)$(PREFIX)/bin/fgrep
	@rm -f $(DESTDIR)$(MANPREFIX)/man1/egrep.1
	@rm -f $(DESTDIR)$(MANPREFIX)/man1/fgrep.1
