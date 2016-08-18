ROOT=..

include $(ROOT)/config.mk

all:
	@$(MAKE) ARCH=arm || exit
	@echo done

install:
	@mkdir -p $(DESTDIR)/boot/overlays
	@cp arch/arm/boot/dts/*.dtb $(DESTDIR)/boot/
	@cp arch/arm/boot/dts/overlays/*.dtbo $(DESTDIR)/boot/overlays/
	@scripts/mkknlimg arch/arm/boot/zImage $(DESTDIR)/boot/kernel.img
	@cp .config $(DESTDIR)/boot/config
	@echo installed

uninstall:
	@rm -f $(DESTDIR)/boot/config
	@rm -f $(DESTDIR)/boot/kernel.img
	@rm -f $(DESTDIR)/boot/overlays/*.dtbo
	@rm -f $(DESTDIR)/boot/*.dtb
	@echo uninstalled

clean:
	@$(MAKE) ARCH=arm clean
	echo cleaned

.PHONY: all install clean
