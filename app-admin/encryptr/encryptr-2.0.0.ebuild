# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit desktop unpacker

DESCRIPTION="Encryptr is a zero-knowledge cloud-based password manager"
HOMEPAGE="https://spideroak.com"
SRC_URI="
	amd64? ( https://spideroak.com/dist/encryptr/signed/linux/targz/encryptr-${PV}_amd.tar.gz )
	x86? ( https://spideroak.com/dist/encryptr/signed/linux/targz/encryptr-${PV}_i386.tar.gz )"

LICENSE="GPL-3"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="experimental"

REQUIRED_USE=""

RDEPEND="
	virtual/udev
	virtual/libudev
	sys-libs/libudev-compat
	media-video/ffmpeg"

RESTRICT="mirror strip"

S="${WORKDIR}"

pkg_nofetch() {
	elog "Please download ${A}"
	elog "from ${HOMEPAGE}/encryptr/download/"
	elog "file in ${DISTDIR}"
}

src_prepare() {
	default
}

src_install() {
	insinto /opt/encryptr
	doins -r Encryptr/*

	fperms +x /opt/encryptr/encryptr-bin

	dobin "${FILESDIR}/encryptr"

	make_desktop_entry encryptr-bin Encryptr \
		"${FILESDIR}/logo.png" \
		Security
}
