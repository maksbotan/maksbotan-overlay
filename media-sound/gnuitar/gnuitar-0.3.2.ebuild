# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/jacklab/gentoo/media-sound/gnuitar/gnuitar-0.3.2.ebuild,v 1.2 2006/04/10 16:35:53 gimpel Exp $

EAPI=2

RESTRICT="mirror"
DESCRIPTION="A program for real-time guitar sound effect processing"
HOMEPAGE="http//www.gnuitar.com"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+float clip-everywhere debug"

DEPEND=">=x11-libs/gtk+-2.0
		dev-util/pkgconfig"

src_configure() {
	econf	--with-gtk2								\
		$(use_enable float)							\
		$(use_enable clip-everywhere)				\
		$(use_enable debug) || die "econf failed"	
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
