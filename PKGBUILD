# Maintainer: Jonathan Cowling <09cowlingj@gmail.com>
pkgname=map-io
pkgver=1.0.2
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
  "https://github.com/cowlingj/$pkgname/tarball/$pkgver"
)
noextract=()
validpgpkeys=()
md5sums=('cd100b785537ace274863964b28d7270'
         '2ec1983b316bf651accc3a870bde23b6'
         '86bfa33509898a2bdb7619bbf2d91666')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  make install
}

