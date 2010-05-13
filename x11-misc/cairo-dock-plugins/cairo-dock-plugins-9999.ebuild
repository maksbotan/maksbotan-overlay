# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
EBZR_REPO_URI="lp:cairo-dock-plug-ins"

inherit cmake-utils bzr

DESCRIPTION="Official plugins for cairo-dock"
HOMEPAGE="https://launchpad.net/cairo-dock-plug-ins"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="alsa gmenu gnome webkit kde network-monitor scooby-do xfce doncky"

RDEPEND="~x11-misc/cairo-dock-${PV}
	alsa? ( media-libs/alsa-lib )
	media-libs/libexif
	gmenu? ( gnome-base/gnome-menus )
	x11-libs/vte
	webkit? ( >=net-libs/webkit-gtk-1.0 )
	xfce? ( xfce-base/thunar )
	x11-libs/libXxf86vm
	x11-libs/libxklavier
	x11-apps/xrandr"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	dev-util/pkgconfig"

my-cmake_use_enable() {
	if x$2 == x; then $2=$1; fi;
	if use $1; then
		echo '-Denable_'$2'=yes';
	else
		echo '-Denable_'$2'=no'
	fi
}

src_configure() {
		mycmakeargs="
		$(my-cmake_use_enable alsa  alsa_mixer)        \
		$(my-cmake_use_enable gmenu)                   \
		$(my-cmake_use_enable gnome gnome_integration) \
		$(my-cmake_use_enable kde kde_integration)	  \
		$(my-cmake_use_enable xfce xfce_integration)   \
		$(my-_cmake_use_enable network-monitor)		  \
		$(my-cmake_use_enable scooby-do)				  \
		$(my-cmake_use_enable doncky)				  \
		$(my-cmake_use_enable webkit weblets)"
		cmake-utils_src_configure
}

pkg_postinst() {
	ewarn "THIS IS A LIVE EBUILD, SO YOU KNOW THE RISKS !"
	ewarn "DO NOT report bugs to Gentoo's bugzilla"
	einfo "Please report all bugs to #gentoo-desktop-effects"
	einfo "Thank you on behalf of the Gentoo Desktop-Effects team"
}
