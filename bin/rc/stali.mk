ROOT=../..

include $(ROOT)/config.mk

BIN = rc.init rc.exit

all: $(BIN)

clean:

install: all
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)

uninstall:
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN)

