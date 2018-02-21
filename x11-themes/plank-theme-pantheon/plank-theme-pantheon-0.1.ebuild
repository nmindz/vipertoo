# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Plank theme for elementary OS"
HOMEPAGE="https://launchpad.net/plank-theme-pantheon"
SRC_URI="https://code.launchpad.net/~elementary-os/+archive/stable/+files/${PN}_${PV}%7Er6-0%2Bpkg3%2Br1%7Eprecise1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	pantheon-base/plank"

DOCS=( COPYING )

src_unpack() {
	default

	mv "${WORKDIR}/recipe-{debupstream}~r{revno}-0+pkg{revno:packaging}+r1" "${S}"
}

src_install() {
	insinto /usr/share/plank/themes
	doins -r Pantheon

	base_src_install_docs
}
