# Copyright 2017 Hacking Networked Solutions
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

DESCRIPTION="Google Cloud SDK"
SLOT="0"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${P}-linux-x86_64.tar.gz"

LICENSE="https://cloud.google.com/terms/"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/google-cloud-sdk"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_prepare() {
	default
    python_fix_shebang --force .
}

src_install() {
	dodir ${ROOT}/usr/share/google-cloud-sdk
	cp -R "${S}/" "${D}/usr/share/" || die "Install failed!"
	dosym ${D}/usr/share/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
	doman ${D}/usr/share/google-cloud-sdk/help/man/man1/*.1
	rm -rf "${D}/usr/share/google-cloud-sdk/help"
	python_optimize "${D}"usr/share/${PN}
}
