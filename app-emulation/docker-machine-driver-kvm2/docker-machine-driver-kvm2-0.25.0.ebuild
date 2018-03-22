# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="The KVM2 driver, intended to replace the deprecated KVM driver"
HOMEPAGE="https://github.com/kubernetes/minikube/"
SRC_URI="https://github.com/kubernetes/minikube/releases/download/v${PV}/docker-machine-driver-kvm2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=sys-cluster/minikube-${PV}"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack () {
   cp "$DISTDIR/$PN" .
}

src_install() {
	dobin docker-machine-driver-kvm2
}