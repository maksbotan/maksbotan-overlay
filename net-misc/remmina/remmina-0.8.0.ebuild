# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit gnome2-utils

DESCRIPTION="GTK+ Remote Desktop Client"
HOMEPAGE="http://remmina.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug nls avahi vte unique ssh gcrypt"

RDEPEND="
	>=dev-libs/glib-2.20.0
	>=x11-libs/gtk+-2.16.0
	avahi? ( >=net-dns/avahi-0.6.22 )
	vte? ( >=x11-libs/vte-0.12.0 )
	unique? ( >=dev-libs/libunique-1.0.8 )
	ssh? ( >=net-libs/libssh-0.4 )
	gcrypt? ( >=dev-libs/libgcrypt-1.4.0 )"
DEPEND="${DEPEND}
	dev-util/intltool"

src_configure(){
	econf \
		$(use_enable debug) \
		$(use_enable nls) \
		$(use_enable avahi) \
		$(use_enable vte) \
		$(use_enable unique) \
		$(use_enable ssh) \
		$(use_enable gcrypt) \
		--disable-dependency-tracking
}

src_install(){
	emake DESTDIR="${ED}" install
	dodoc AUTHORS ChangeLog README
}

pkg_preinst(){
	gnome2_icon_savelist
}

pkg_postinst(){
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
