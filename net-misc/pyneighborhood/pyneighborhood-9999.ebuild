# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/n/N}"

EBZR_REPO_URI="lp:pyneighborhood"

PYTHON_DEPEND="2"
inherit python bzr

DESCRIPTION="GTK+ 2 rewrite of LinNeighborhood"
HOMEPAGE="http://lauchpad.net/pyneighborhood"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	|| ( net-fs/mount-cifs >=net-fs/samba-3.4.6 )
	=dev-python/pygtk-2*"

S="${WORKDIR}/${MY_P}"

src_compile() {
	./configure --prefix=/usr || die "./configure failed" # Not a standard configure script
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
