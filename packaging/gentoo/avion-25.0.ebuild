EAPI=7
DESCRIPTION="Animacion ASCII de un avion en la terminal"
HOMEPAGE="https://github.com/tomasmartingrinberg-cpu/dc"
SRC_URI="https://github.com/tomasmartingrinberg-cpu/dc/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Toyoda"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="app-shells/bash sys-libs/ncurses"

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
