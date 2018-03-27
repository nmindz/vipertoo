# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils unpacker

DESCRIPTION="Broadcom bluetooth firmware for BCM20702A1 based devices"
HOMEPAGE="https://aur.archlinux.org/packages/bcm20702a1-firmware/"
SRC_URI="http://dlcdnet.asus.com/pub/ASUS/wireless/USB-BT400/DR_USB_BT400_${PV}_Windows.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
    app-misc/hex2hcd
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
DESTDIR="/lib/firmware/brcm/"

src_unpack () {
    unpack_zip ${A}
}

# It does not look quite right... but it works.
# TODO: Check if it is all necessary

src_install() {
	dodir ${DESTDIR%/}
    into ${DESTDIR%/}

    hex2hcd ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hex \
    ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hcd

    addpredict ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hcd
    addpredict ${DESTDIR%/}/BCM20702A1_001.002.014.1443.1572.hcd
    addpredict ${DESTDIR%/}/BCM20702A1-0a5c-216f.hcd
    addpredict ${DESTDIR%/}/BCM20702A0-0a5c-216f.hcd

    doins ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hcd
    dosym ${DESTDIR%/}/BCM20702A1_001.002.014.1443.1572.hcd ${DESTDIR%/}/BCM20702A1-0a5c-216f.hcd
    dosym ${DESTDIR%/}/BCM20702A1-0a5c-216f.hcd ${DESTDIR%/}/BCM20702A0-0a5c-216f.hcd
}