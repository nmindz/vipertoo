# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools fdo-mime flag-o-matic

DESCRIPTION="A background browser and setter for X"
HOMEPAGE="https://github.com/l3ib/nitrogen"
SRC_URI="http://projects.l3ib.org/${PN}/files/${P}.tar.gz"

# https://github.com/l3ib/nitrogen.git

if [[ "${PV}" == "9999" ]]; then
	#KEYWORDS=""
	EGIT_REPO_URI="https://github.com/l3ib/nitrogen"
	inherit git-r3
	SRC_URI=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="nls xinerama"

RDEPEND="
	>=dev-cpp/gtkmm-2.10:2.4
	>=gnome-base/librsvg-2.20:2
	>=x11-libs/gtk+-2.10:2
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
	xinerama? ( x11-proto/xineramaproto )
"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	append-cxxflags -std=c++11
	econf \
		# $(use_enable nls) \
		$(use_enable xinerama)
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
