#!/bin/bash
# Script: build_packages.sh
# Ubicación: Raíz del proyecto (/DC)
# Función: Generar archivos de empaquetado para múltiples distros.

set -e

# --- Configuración Global 2025 ---
VERSION="25.0"
PKG_NAME="avion"
MAINTAINER="Tomy <tomy.martin.grinberg@.com>"
SOURCE_URL="https://github.com/tomasmartingrinberg-cpu/dc"

# Colores para la terminal
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}Generando plantillas de empaquetado para la versión $VERSION...${NC}"

# 1. ARCH LINUX (PKGBUILD)
# Define cómo construir el paquete en Arch, Manjaro y derivados.
mkdir -p packaging/arch
cat > packaging/arch/PKGBUILD <<EOF
pkgname=$PKG_NAME
pkgver=$VERSION
pkgrel=1
pkgdesc="Animacion ASCII de un avion en la terminal (Bash)"
arch=('any')
url="$SOURCE_URL"
license=('Toyoda')
depends=('bash' 'ncurses')
makedepends=('make')
source=("\$pkgname-\$pkgver.tar.gz::$SOURCE_URL/archive/refs/tags/v$VERSION.tar.gz")
sha256sums=('SKIP')

package() {
    cd "\$srcdir/dc-$VERSION"
    make DESTDIR="\$pkgdir" PREFIX=/usr install
}
EOF

# 2. DEBIAN/UBUNTU (Carpeta debian/)
# Archivos necesarios para crear un archivo .deb.
mkdir -p packaging/debian/debian/source
echo "12" > packaging/debian/debian/compat
cat > packaging/debian/debian/control <<EOF
Source: $PKG_NAME
Section: utils
Priority: optional
Maintainer: $MAINTAINER
Build-Depends: debhelper (>= 12), make
Standards-Version: 4.5.0

Package: $PKG_NAME
Architecture: all
Depends: bash, ncurses-bin, \${misc:Depends}
Description: Avion ASCII animado v$VERSION
 Script en Bash que muestra un avion volando.
EOF

cat > packaging/debian/debian/rules <<'EOF'
#!/usr/bin/make -f
%:
	dh $@
EOF
chmod +x packaging/debian/debian/rules

# 3. FEDORA / openSUSE (RPM Spec)
# Archivo de especificación para crear paquetes .rpm.
mkdir -p packaging/rpm
cat > packaging/rpm/avion.spec <<EOF
Name:           $PKG_NAME
Version:        $VERSION
Release:        1%{?dist}
Summary:        Avion ASCII animado (v$VERSION)
License:        Toyoda
URL:            $SOURCE_URL
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch
BuildRequires:  make
Requires:       bash, ncurses

%description
Animacion de un avion para la terminal escrita en Bash para el año 2025.

%install
make DESTDIR=%{buildroot} PREFIX=/usr install

%files
%{_bindir}/avion

%changelog
* $(date +"%a %b %d %Y") $MAINTAINER - $VERSION-1
- Lanzamiento de la versión $VERSION
EOF

# 4. GENTOO (Ebuild)
mkdir -p packaging/gentoo
cat > packaging/gentoo/avion-$VERSION.ebuild <<EOF
EAPI=7
DESCRIPTION="Animacion ASCII de un avion en la terminal"
HOMEPAGE="$SOURCE_URL"
SRC_URI="$SOURCE_URL/archive/v\${PV}.tar.gz -> \${P}.tar.gz"
LICENSE="Toyoda"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="app-shells/bash sys-libs/ncurses"

src_install() {
	emake DESTDIR="\${D}" PREFIX=/usr install
}
EOF

# 5. ALPINE LINUX (APKBUILD)
mkdir -p packaging/alpine
cat > packaging/alpine/APKBUILD <<EOF
pkgname=$PKG_NAME
pkgver=$VERSION
pkgrel=0
pkgdesc="Avion ASCII animado v$VERSION"
url="$SOURCE_URL"
arch="noarch"
license="Toyoda"
depends="bash ncurses"
makedepends="make"
source="\$pkgname-\$pkgver.tar.gz::$SOURCE_URL/archive/v$VERSION.tar.gz"

package() {
	make DESTDIR="\$pkgdir" PREFIX=/usr install
}
EOF

echo -e "${GREEN}¡Éxito! Todas las plantillas para la versión $VERSION han sido creadas en /packaging${NC}"
