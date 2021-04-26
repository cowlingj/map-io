# Maintainer: Jonathan Cowling <09cowlingj@gmail.com>
pkgname=map-io
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Restrict a chosen input to a single display"
arch=('any')
url='https://github.com/cowlingj/map-io'
license=('MIT')
groups=()
depends=("bash")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname.sh"
        "$pkgname.desktop")
noextract=()
validpgpkeys=()
md5sums=('ce27471fecf18ba52a2d132a639c2cea'
         '2ec1983b316bf651accc3a870bde23b6')

package() {
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/applications/"
  mv "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgname.desktop" "$pkgdir/usr/share/applications/"
}

