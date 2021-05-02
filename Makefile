build:
	ronn -r man.md | gzip - > "$pkgname.1.gz"

install:
	install -D -t "$pkgname.1.gz" "/usr/share/man/uk/man1/" 
	install -D -T "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"

arch:
	DIST="./dist"
	mkdir -p "$DIST"

	export PKGDEST="$DIST/pkg"
	export SRCDEST="$DIST/src"

	makepkg -Ccfirs --noconfirm

run:
	./map-io.sh

checksum:
	updpkgsums
