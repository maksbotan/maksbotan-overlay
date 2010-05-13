# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PYTHON_DEPEND="2:2.5"

inherit autotools python

DESCRIPTION="Synchronization daemon for the Ubuntu One file sharing service"
HOMEPAGE="http://one.ubuntu.com"
SRC_URI="mirror://ubuntu/pool/main/u/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug nautilus"

RDEPEND="dev-libs/dbus-glib 
	nautilus? (
		gnome-base/nautilus 
		gnome-extra/evolution-data-server 
		gnome-base/gconf:2
	)
	dev-python/ubuntuone-storage-protocol 
	dev-python/oauth 
"


DEPEND="dev-util/intltool
	dev-util/pkgconfig
	${RDEPEND}
"

src_prepare() {
	epatch "${FILESDIR}"/ubuntuone-client-optional-nautilus.patch
	eautoreconf
}

src_configure() {
	local myconf="--disable-rendering --disable-pycentral"
	econf \
		$(use_enable debug) \
		$(use_enable nautilus nautilus-extension) \
		${myconf}
}

src_install(){
	emake DESTDIR="${D}" install || die "install failed"
	rm "${D}/$(python_get_sitedir)/ubuntuone/__init__.py"
}
