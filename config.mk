# stali version
VERSION = 0.0

# paths
DESTDIR=$(HOME)/rootfs-x86_64
PREFIX = /
MANPREFIX = $(PREFIX)/share/man

CC = $(ROOT)/../toolchain/x86_64-linux-musl/bin/x86_64-linux-musl-gcc
LD = $(CC)

YACC = $(ROOT)/bin/hbase/yacc/yacc
AR = $(ROOT)/../toolchain/x86_64-linux-musl/bin/x86_64-linux-musl-ar
RANLIB = $(ROOT)/../toolchain/x86_64-linux-musl/bin/x86_64-linux-musl-ranlib

CPPFLAGS = -D_POSIX_SOURCE
CFLAGS   = -I$(ROOT)/../toolchain/x86_64-linux-musl/x86_64-linux-musl/include
#-std=c99 -Wall -pedantic
LDFLAGS  = -s -static
