SRC ?= "./pico-8_0.2.7_amd64"
ARCH ?= "x86_64"

APPDIR := "pico8.AppDir"
ICON := "pico8.png"

.PHONY: clean icons mimetypes

all: clean icons mimetypes PICO-8-x86_64.AppImage

clean:
	$(RM) ./PICO-8-$(ARCH).AppImage
	$(RM) -r $(APPDIR)

icons: SIZES := 512 256 128 64 32 16
icons:
	for size in $(SIZES); do \
		mkdir -p "$(APPDIR)/usr/share/icons/hicolor/$${size}x$${size}/apps"; \
		magick ./$(ICON) -resize $${size}x$${size} $(APPDIR)/usr/share/icons/hicolor/$${size}x$${size}/apps/$(ICON); \
	done;

mimetypes:
	mkdir -p $(APPDIR)/usr/share/mime/packages/
	cp ./pico8-mimetypes.xml $(APPDIR)/usr/share/mime/packages/pico8-mimetypes.xml

PICO-8-x86_64.AppImage:
	mkdir -p $(APPDIR)/usr/bin
	cp -t $(APPDIR)/usr/bin/ $(SRC)/pico-8/pico8 $(SRC)/pico-8/pico8.dat
	linuxdeploy --appdir $(APPDIR) --output appimage --desktop-file ./pico8.desktop
