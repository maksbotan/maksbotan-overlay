# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="http://github.com/baverman/snaked.git"

inherit distutils git

DESCRIPTION="Minimalist editor inspired by Scribes"
HOMEPAGE="http://github.com/baverman/snaked"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/pygtksourceview
	dev-python/rope
	dev-python/pyflakes"
