# stali version
VERSION = 0.0

# paths
DESTDIR=$(HOME)/rootfs-arm
PREFIX = /
MANPREFIX = $(PREFIX)/share/man

M4 = m4
HOSTCC = $(ROOT)/../toolchain/bin/x86_64-linux-musl-gcc
CC = $(ROOT)/../toolchain/bin/arm-linux-musleabi-gcc
CXX = $(ROOT)/../toolchain/bin/arm-linux-musleabi-g++
AS = $(ROOT)/../toolchain/bin/arm-linux-musleabi-as
LD = $(CC)

YACC = $(ROOT)/bin/hbase/yacc/yacc
HOSTAR = $(ROOT)/../toolchain/bin/x86_64-linux-musl-ar
AR = $(ROOT)/../toolchain/bin/arm-linux-musleabi-ar
HOSTRANLIB = $(ROOT)/../toolchain/bin/x86_64-linux-musl-ranlib
RANLIB = $(ROOT)/../toolchain/bin/arm-linux-musleabi-ranlib

HOSTCPPFLAGS = -D_POSIX_SOURCE -D__stali__ 
CPPFLAGS = -D_POSIX_SOURCE -D__stali__ -D__arm__
HOSTCFLAGS   = -I$(ROOT)/../toolchain/x86_64-linux-musl/include
CFLAGS   = -I$(ROOT)/../toolchain/arm-linux-musleabi/include
CXXFLAGS   = -I$(ROOT)/../toolchain/arm-linux-musleabi/include
#-std=c99 -Wall -pedantic
#LDFLAGS  = -s -static
LDFLAGS  = -static
