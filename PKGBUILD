# Maintainer: Jonathan Cowling <09cowlingj@gmail.com>
pkgname=map-io
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Restrict a chosen input to a single display"
arch=('any')
url='https://github.com/cowlingj/map-io'
license=('MIT')
groups=()
depends=(
  "bash"
  "yad"
)
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
md5sums=('bf76faa135c4ec33e3d1ac37b927378c'
         '2ec1983b316bf651accc3a870bde23b6')

package() {
  # mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/applications/"
  install -D -t "$pkgdir/usr/bin/$pkgname" "$pkgname.sh"
  install -D -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
}

