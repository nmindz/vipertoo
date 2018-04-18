# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit desktop eutils gnome2-utils pax-utils unpacker versionator xdg-utils

DESCRIPTION="Caixa Economica Federal (caixa.gov.br) Security Module"
HOMEPAGE="https://internetbanking.caixa.gov.br/sinbc/nb/login/redirecionaDispSeguranca"
SRC_URI="https://cloud.gastecnologia.com.br/cef/warsaw/install/GBPCEFwr64.deb"

LICENSE=""
SLOT="2018"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	doinitd ${FILESDIR}/warsaw
	insinto /usr/local/etc/warsaw
	doins -r usr/local/etc/warsaw/* 	|| die "installing conf files failed"

	into /usr/local/bin/warsaw
	dobin usr/local/bin/warsaw/* 	|| die "installing binaries failed"
	dolib.so usr/local/lib/warsaw/* 	|| die "installing libs failed"

	docinto /usr/share/doc/warsaw
	dodoc usr/share/doc/warsaw/*		|| die "installing docs failed"
}