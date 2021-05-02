DIST_DIR=./dist
PKGNAME=map-io
PKGDIR=pkg

build:
	ronn -r man.md | gzip - > "$(PKGNAME).1.gz"

install:
	install -D -t "$(PKGNAME).1.gz" "/usr/share/man/uk/man1/" 
	install -D -T "$(PKGNAME).sh" "$(PKGDIR)/usr/bin/$(PKGNAME)"
	install -D -t "$(PKGDIR)/usr/share/applications/" "$(PKGNAME).desktop"

arch:
	DIST="./dist"
	mkdir -p "$(DIST_DIR)"

	export PKGDEST="$(DIST_DIR)/pkg"
	export SRCDEST="$(DIST_DIR)/src"

	makepkg -Ccfirs --noconfirm

run:
	./map-io.sh

checksum:
	updpkgsums
