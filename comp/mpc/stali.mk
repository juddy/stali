ROOT=../..

include $(ROOT)/config.mk

CFLAGS += -std=gnu99 -I. -Isrc -I../gmp -I../mpfr -O2 -fstack-protector-strong -Wformat -Werror=format-security 
CPPFLAGS += -DHAVE_CONFIG_H 
LIB = libmpc.a
OBJS = src/mul.o\
	src/pow_ui.o\
	src/pow_ld.o\
	src/add.o\
	src/pow_si.o\
	src/get_prec.o\
	src/arg.o\
	src/ui_div.o\
	src/get_prec2.o\
	src/get_str.o\
	src/strtoc.o\
	src/uceil_log2.o\
	src/ui_ui_sub.o\
	src/acos.o\
	src/sqr.o\
	src/div_fr.o\
	src/mul_i.o\
	src/asin.o\
	src/cos.o\
	src/neg.o\
	src/set_str.o\
	src/tanh.o\
	src/div.o\
	src/pow_d.o\
	src/atanh.o\
	src/asinh.o\
	src/norm.o\
	src/fr_sub.o\
	src/get_version.o\
	src/sin.o\
	src/cosh.o\
	src/sinh.o\
	src/sub_fr.o\
	src/fr_div.o\
	src/pow.o\
	src/swap.o\
	src/pow_fr.o\
	src/sqrt.o\
	src/clear.o\
	src/real.o\
	src/conj.o\
	src/log.o\
	src/div_2exp.o\
	src/atan.o\
	src/exp.o\
	src/mul_2exp.o\
	src/cmp.o\
	src/sub.o\
	src/cmp_si_si.o\
	src/pow_z.o\
	src/proj.o\
	src/imag.o\
	src/div_ui.o\
	src/add_ui.o\
	src/urandom.o\
	src/set_x.o\
	src/tan.o\
	src/set.o\
	src/init3.o\
	src/mul_ui.o\
	src/abs.o\
	src/sub_ui.o\
	src/mem.o\
	src/acosh.o\
	src/init2.o\
	src/add_fr.o\
	src/out_str.o\
	src/inp_str.o\
	src/set_prec.o\
	src/mul_fr.o\
	src/set_x_x.o\
	src/mul_si.o

CLEAN_FILES = 

include $(ROOT)/mk/lib.mk

deps: $(CLEAN_FILES)
