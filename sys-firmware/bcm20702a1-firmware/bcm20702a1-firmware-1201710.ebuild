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
FEATURE="-usersandbox -sandbox"

DEPEND="
    app-misc/hex2hcd
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
D="/lib/firmware/brcm/"

src_unpack () {
    unpack_zip "${DISTDIR}/${A}"
}

src_prepare() {
    eapply_user

	hex2hcd ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hex \
    ${S%/}/Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hcd
}

src_install() {
    insinto /lib/firmware/brcm
	doins -r Win10_USB-BT400_DRIVERS/Win10_USB-BT400_Driver_Package/64/BCM20702A1_001.002.014.1443.1572.hcd
    dosym ${D%/}/BCM20702A1_001.002.014.1443.1572.hcd /lib/firmware/brcm/BCM20702A1-0a5c-216f.hcd
    dosym ${D%/}/BCM20702A1-0a5c-216f.hcd /lib/firmware/brcm/BCM20702A0-0a5c-216f.hcd
}

pkg_postinst() {
    elog "################################################################################"
	elog "# The firmware files were installed to /lib/firmware/brcm/                     #"
	elog "# Do not forget to restart the bluetooth service in order to load the firmware #"
    elog "################################################################################"
}