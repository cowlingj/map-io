# Maintainer: Jonathan Cowling <09cowlingj@gmail.com>
pkgname=map-io-git
pkgver=1.0.4
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
  "xorg-xrandr"
  "xorg-xinput"
)
makedepends=(
  "git"
  "make"
  "ruby-ronn-ng"
  "gzip"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname-$pkgver::git+https://github.com/cowlingj/map-io"
)
noextract=()
validpgpkeys=()
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make build 
}

package() {
  cd "$pkgname-$pkgver"
  make install
}

