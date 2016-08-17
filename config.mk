# stali version
VERSION = 0.0

# paths
DESTDIR=$(HOME)/rootfs-arm
PREFIX = /
MANPREFIX = $(PREFIX)/share/man

M4 = m4
CC = $(ROOT)/../toolchain/bin/arm-linux-musl-gcc
CXX = $(ROOT)/../toolchain/bin/arm-linux-musl-g++
AS = $(ROOT)/../toolchain/bin/arm-linux-musl-as
LD = $(CC)

YACC = $(ROOT)/bin/hbase/yacc/yacc
AR = $(ROOT)/../toolchain/bin/arm-linux-musl-ar
RANLIB = $(ROOT)/../toolchain/bin/arm-linux-musl-ranlib

CPPFLAGS = -D_POSIX_SOURCE -D__stali__
CFLAGS   = -I$(ROOT)/../toolchain/arm-linux-musl/include
CXXFLAGS   = -I$(ROOT)/../toolchain/arm-linux-musl/include
#-std=c99 -Wall -pedantic
#LDFLAGS  = -s -static
LDFLAGS  = -static
