DIST_DIR=./dist
PKGNAME=map-io
PKGDIR=pkg

.PHONY: build install arch arch-checksum arch-install run arch-docker-build flatpak-builld flatpak-install flatpak-run

build:
	ronn -r man.md --pipe | gzip - > "$(PKGNAME).1.gz"

install:
	install -D -t "$(PKGDIR)/usr/share/man/man1/" "$(PKGNAME).1.gz" 
	install -D -T "$(PKGNAME).sh" "$(PKGDIR)/usr/bin/$(PKGNAME)"
	install -D -t "$(PKGDIR)/usr/share/applications/" "$(PKGNAME).desktop"

arch: build arch-docker-build arch-install

arch-docker-build:
	docker build -t arch wrappers/arch/ 

arch-checksum:
	cd wrappers/arch/; updpkgsums


ARCH_PKGBUILD=PKGBUILD
arch-install:
	-rm wrappers/arch/$(PKGNAME)*.tar.gz
	cd wrappers/arch/; makepkg -Ccfirs --noconfirm -p $(ARCH_PKGBUILD)

flatpak-build:
	flatpak-builder build wrappers/flatpak/manifest.yml --force-clean

flatpak-install:
	flatpak-builder --user --install --force-clean build wrappers/flatpak/manifest.yml
  
flatpak-run:
	flatpak run local.jonathancowling.MapIO

deb-docker-build:
	docker build -t deb wrappers/debian/ 

deb-build:
	rm -r build dist
	mkdir -p build dist build/map-io/DEBIAN/
	make PKGDIR=build/map-io build install
	cp wrappers/debian/control build/map-io/DEBIAN/
	dpkg -b build/map-io dist/map-io.deb

deb-install:
	- sudo dpkg -i
	apt-get install -f -y

run:
	./map-io.sh
