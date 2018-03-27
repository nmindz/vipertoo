# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Convert Broadcom HEX firmware into HCD format"
HOMEPAGE="https://github.com/jessesung/hex2hcd/"
EGIT_REPO_URI="https://github.com/jessesung/hex2hcd.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	make
	dobin hex2hcd
}
