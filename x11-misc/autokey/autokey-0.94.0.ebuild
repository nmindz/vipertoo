# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_4,3_5,3_6} )
inherit eutils gnome2-utils distutils-r1 python-r1

DESCRIPTION="Desktop automation utility for Linux and X11"
HOMEPAGE="https://github.com/autokey/autokey"
SRC_URI="https://github.com/autokey/autokey/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk doc"
REQUIRED_USE="|| ( gtk )"

DEPEND="dev-python/python-xlib
	dev-python/dbus-python
	gnome-extra/zenity
	media-gfx/imagemagick[svg]
	dev-python/pyinotify
	x11-misc/wmctrl
	x11-misc/xautomation
	x11-themes/hicolor-icon-theme
	x11-apps/xwd
	gtk? ( =dev-python/pygobject-3*
		x11-libs/libnotify
		dev-python/pygtksourceview )"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${PV}"

# qt4 doesn't work... deps for qt4 for future reference:
# x11-libs/qscintilla[python] dev-python/PyQt4[X,dbus] kde-base/pykde4
src_prepare() {
	epatch "${FILESDIR}"/${P}-disable-qt4.patch
	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install
	rm ${D}/usr/share/applications/autokey-qt.desktop

	if use doc; then
		dodoc -r "${S}"/doc/scripting
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
