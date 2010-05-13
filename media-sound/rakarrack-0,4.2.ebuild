# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit autotools

DESCRIPTION="Basic rack of 10 effects for guitar with presets, banks and MIDI control"
HOMEPAGE="http://rakarrack.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-util/pkgconfig
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-sound/alsa-utils
	media-sound/jack-audio-connection-kit
	x11-libs/fltk:1.1
	x11-libs/libXft
	x11-libs/libXpm
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/-fPIC//' ${S}/configure.in
	sed -i 's/-fomit-frame-pointer//' ${S}/configure.in
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
}