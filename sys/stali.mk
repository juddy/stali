ROOT=..
KERNEL=kernel7

include $(ROOT)/config.mk

all:
	@$(MAKE) -j7 KERNEL=$(KERNEL) ARCH=arm zImage dtbs || exit
	@echo done

install:
	@mkdir -p $(DESTDIR)/boot/overlays
	@cp arch/arm/boot/dts/*.dtb $(DESTDIR)/boot/
	@cp arch/arm/boot/dts/overlays/*.dtb* $(DESTDIR)/boot/overlays/
	@cp arch/arm/boot/dts/overlays/README $(DESTDIR)/boot/overlays/
	@scripts/mkknlimg arch/arm/boot/zImage $(DESTDIR)/boot/$(KERNEL).img
	@cp .config $(DESTDIR)/boot/config
	@echo installed

uninstall:
	@rm -f $(DESTDIR)/boot/config
	@rm -f $(DESTDIR)/boot/kernel.img
	@rm -f $(DESTDIR)/boot/overlays/*.dtb*
	@rm -f $(DESTDIR)/boot/overlays/README
	@rm -f $(DESTDIR)/boot/*.dtb
	@echo uninstalled

clean:
	@$(MAKE) ARCH=arm clean
	echo cleaned

.PHONY: all install clean
