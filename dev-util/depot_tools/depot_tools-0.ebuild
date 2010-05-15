# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

ESVN_REPO_URI="http://src.chromium.org/svn/trunk/tools/depot_tools"
PYTHON_DEPEND="2"

inherit python subversion

DESCRIPTION="Package of scripts to manage integration with Chromium repository
and development process"
HOMEPAGE="http://dev.chromium.org/developers/how-tos/depottools"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${D}"/opt/"${PN}"
	mkdir -p "${D}"/usr/bin
	cp -R "${S}"/* "${D}"/opt/"${PN}"/
	for i in chrome-update.py cpplint.py create-chromium-git-src gcl gclient git-cl git-cl-upload-hook git-gs git-try hammer presubmit_support.py trychange.py watchlists.py wtf
	do
		cp "${FILESDIR}"/wrapper "${D}"/usr/bin/$i
	done
	dodoc README README.gclient LICENSE
}
