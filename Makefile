DIST_DIR=./dist
PKGNAME=map-io
PKGDIR=pkg

.PHONY: build install arch arch-checksum arch-install run arch-docker-build

build:
	ronn -r man.md --pipe | gzip - > "$(PKGNAME).1.gz"

install:
	install -D -t "$(PKGNAME).1.gz" "/usr/share/man/uk/man1/" 
	install -D -T "$(PKGNAME).sh" "$(PKGDIR)/usr/bin/$(PKGNAME)"
	install -D -t "$(PKGDIR)/usr/share/applications/" "$(PKGNAME).desktop"

arch: arch-checksum arch-docker-build arch-install

arch-docker-build:
	docker build -t arch wrappers/arch/ 

arch-checksum:
	cd wrappers/arch/; updpkgsums

arch-install:
	-rm wrappers/arch/$(PKGNAME)*.tar.gz
	cd wrappers/arch/; makepkg -Ccfirs --noconfirm

run:
	./map-io.sh
