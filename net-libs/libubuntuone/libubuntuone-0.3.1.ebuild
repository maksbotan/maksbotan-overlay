# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PYTHON_DEPEND="2:2.6"

inherit mono python

DESCRIPTION="Ubuntu One GTK integration widgets"
HOMEPAGE="https://launchpad.net/libubuntuone"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/gnome-doc-utils
	dev-dotnet/gtk-sharp:2
	dev-lang/mono
	dev-libs/dbus-glib
	dev-libs/glib:2
	dev-libs/libxml2
	dev-libs/openssl
	dev-python/pygobject
	dev-python/pygtk:2
	dev-util/gtk-doc
	dev-util/intltool
	gnome-base/gconf:2
	gnome-base/gnome-keyring
	gnome-extra/evolution-data-server
	net-libs/libsoup-gnome:2.4
	net-libs/webkit-gtk"

RDEPEND="dev-dotnet/gtk-sharp:2
	dev-lang/mono
	dev-libs/dbus-glib
	dev-libs/glib:2
	dev-libs/libxml2
	dev-libs/openssl
	dev-python/pygobject
	dev-python/pygtk:2
	gnome-base/gconf:2
	gnome-base/gnome-keyring
	gnome-extra/evolution-data-server
	net-libs/libsoup-gnome:2.4
	net-libs/webkit-gtk"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	egacinstall "${D}/usr/lib/mono/ubuntuone-sharp-1.0/ubuntuone-sharp.dll"
}