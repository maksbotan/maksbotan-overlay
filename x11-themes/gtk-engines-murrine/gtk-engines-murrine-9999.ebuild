# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gtk-engines-murrine/gtk-engines-murrine-0.90.3-r1.ebuild,v 1.1 2009/05/21 20:09:59 nirbheek Exp $

EAPI="2"

MY_PN="murrine"
MODPATH="${MY_PN}"

inherit eutils gnome.org gnome2-live

DESCRIPTION="Murrine GTK+2 Cairo Engine"

HOMEPAGE="http://www.cimitan.com/murrine/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE="+themes animation-rtl"

RDEPEND=">=x11-libs/gtk+-2.12
	themes? ( x11-themes/murrine-themes )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_PN}"

src_prepare() {
	sed -i 's/AC_PROG_INTLTOOL/IT_PROG_INTLTOOL/' ${S}/configure.ac
	gnome2-live_src_prepare
}

src_configure() {
	econf --enable-animation \
		--enable-rgba \
		$(use_enable animation-rtl animationrtl)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS ChangeLog TODO
}
