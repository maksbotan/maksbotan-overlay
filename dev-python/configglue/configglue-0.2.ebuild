# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PYTHON_DEPEND="2"

EBZR_REPO_URI="lp:configglue"
EBZR_REVISION="12"

inherit distutils bzr python

DESCRIPTION="Library that glues together optparse.OptionParser and ConfigParser.ConfigParser"
HOMEPAGE="http://lauchpad.net/configglue"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

pkg_setup() {
	python_set_active_version 2
}
