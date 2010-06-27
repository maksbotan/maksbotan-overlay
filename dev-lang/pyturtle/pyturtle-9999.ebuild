# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

EGIT_REPO_URI="git://github.com/maksbotan/pyturtle.git"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"

inherit git distutils python

DESCRIPTION="Cross-toolkit Logo interpreter in python"
HOMEPAGE="http://github.com/maksbotan/pyturtle/"
SRC_URI=""

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-python/pygtk
	dev-python/pygoocanvas
	dev-python/py-notify
	dev-util/glade[python]"
