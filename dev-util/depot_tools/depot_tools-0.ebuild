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
RDEPEND="dev-vcs/git[curl]"

src_install() {
	insinto /opt/depot_tools
	doins -r * || die "install failed"
	mkdir -p "${D}"/opt/bin
	#cp -R "${S}"/* "${D}"/opt/"${PN}"/
	for i in chrome-update.py cpplint.py create-chromium-git-src gcl gclient git-cl git-cl-upload-hook git-gs git-try hammer presubmit_support.py trychange.py watchlists.py wtf
	do
		exeinto /opt/depot_tools
		doexe $i || die "install failed"
		exeinto /opt/bin
		#cp "${FILESDIR}"/wrapper "${D}"/opt/bin/$i
		newexe "${FILESDIR}"/wrapper $i || die "install failed"
	done
	dodoc README README.gclient
}
