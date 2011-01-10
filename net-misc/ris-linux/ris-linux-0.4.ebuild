# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils python

DESCRIPTION="BINL server to doing Windows(r) RIS"
HOMEPAGE="http://oss.netfarm.it/guides/pxe.php"
SRC_URI="http://oss.netfarm.it/guides/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( net-ftp/aftp[ris] net-ftp/tftp-hpa[ris] )
	net-misc/dhcp
	net-fs/samba
	sys-boot/syslinux"

src_prepare(){
	sed "s:VERSION:${PV}:" "${FILESDIR}"/setup.py > "${S}"/setup.py
	distutils_src_prepare
}

src_install() {
	distutils_src_install
	insinto /usr/share/ris-linux
	doins winnt.sif
	doins winpe.sif
}
