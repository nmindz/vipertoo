# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit unpacker eutils

DESCRIPTION="N1"
HOMEPAGE="http://www.nylas.com/"

SRC_URI="https://github.com/nylas/nylas-mail/releases/download/${PV}/NylasMail.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gnome-base/libgnome-keyring
"

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
