ROOT=../../..

include $(ROOT)/config.mk

BINS = subst symlinks
CLEAN_FILES = *.o $(BINS) dirpaths.h

all: options deps $(BINS)

options:
	@echo build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

deps: dirpaths.h subst.conf

dirpaths.h:
	@echo "/* fake dirpaths.h for config.h */" > dirpaths.h

subst.conf:
	@cp subst.conf.stali subst.conf

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

subst: subst.o
	@echo LD $@
	@$(CC) -o $@ subst.o $(LDFLAGS)

symlinks: symlinks.o
	@echo LD $@
	@$(CC) -o $@ symlinks.o $(LDFLAGS)

install:

uninstall:

clean:
	@echo cleaning
	@rm -f $(BIN) $(OBJS) $(CLEAN_FILES)

.PHONY: all options clean install uninstall
