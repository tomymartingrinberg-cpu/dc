EAPI=7
DESCRIPTION="Animacion ASCII de un avion en la terminal"
HOMEPAGE="https://github.com/tomasmartingrinberg-cpu/dc"
SRC_URI="https://github.com/tomasmartingrinberg-cpu/dc/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Toyoda"
SLOT="0"
KEYWORDS="~amd64 ~x86"
I_DEPEND="app-shells/bash sys-libs/ncurses"
DEPEND="${I_DEPEND}"
RDEPEND="${I_DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
