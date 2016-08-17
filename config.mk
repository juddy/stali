# stali version
VERSION = 0.0

# paths
DESTDIR=$(HOME)/rootfs-x86_64
PREFIX = /
MANPREFIX = $(PREFIX)/share/man

M4 = m4
CC = $(ROOT)/../toolchain/bin/x86_64-linux-musl-gcc
CXX = $(ROOT)/../toolchain/bin/x86_64-linux-musl-g++
AS = $(ROOT)/../toolchain/bin/x86_64-linux-musl-as
LD = $(CC)

YACC = $(ROOT)/bin/hbase/yacc/yacc
AR = $(ROOT)/../toolchain/bin/x86_64-linux-musl-ar
RANLIB = $(ROOT)/../toolchain/bin/x86_64-linux-musl-ranlib

CPPFLAGS = -D_POSIX_SOURCE -D__stali__
CFLAGS   = -I$(ROOT)/../toolchain/x86_64-linux-musl/include
CXXFLAGS   = -I$(ROOT)/../toolchain/x86_64-linux-musl/include
#-std=c99 -Wall -pedantic
#LDFLAGS  = -s -static
LDFLAGS  = -static
