# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

EBZR_REPO_URI="lp:pyneighborhood"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit python bzr distutils

DESCRIPTION="GTK+ 2 rewrite of LinNeighborhood"
HOMEPAGE="http://lauchpad.net/pyneighborhood"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	|| ( net-fs/mount-cifs >=net-fs/samba-3.4.6 )
	dev-python/pygtk:2
	dev-util/glade[python]"
