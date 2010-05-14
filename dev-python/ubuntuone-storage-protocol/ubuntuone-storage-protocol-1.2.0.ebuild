# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
USE_PYTHON=${USE_PYTHON/2.[45]/}

inherit distutils python

DESCRIPTION="Ubuntu One GTK integration widgets"
HOMEPAGE="http://one.ubuntu.com"
SRC_URI="mirror://ubuntu/pool/main/u/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/protobuf[python]
	dev-python/pyopenssl
	dev-python/pyxdg
	dev-python/twisted
	dev-python/oauth"
