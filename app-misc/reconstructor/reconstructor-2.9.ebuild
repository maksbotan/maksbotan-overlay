# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Reconstructor is a Debian/Ubuntu GNU/Linux distribution customization and
creation toolkit."
HOMEPAGE="reconstructor.org"
SRC_URI="http://www.reconstructor.org/attachments/download/11/reconstructor_${PV}.tar.gz"

LICENSE="GPLv2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="
>=dev-lang/python-2.4.6
dev-python/pygtk
sys-fs/squashfs-tools
app-cdr/cdrtools
net-misc/rsync
"

src_unpack() {
	if [ ${A} != "" ]; then
		unpack ${A}
		mv ${S%/*}/reconstructor_${PV} ${S%/*}/${P}
	fi
}

src_compile() {
	return
}

src_install() {
	mkdir ${D}/usr
	mkdir ${D}/usr/share
	mkdir ${D}/usr/bin
	mkdir ${d}/usr/share/reconstructor
	cp -R ${S}/ ${D}/usr/share/reconstructor
	mkdir ${D}/usr/share/pixmaps
	cp ${S}/glade/reconstructor.png ${D}/usr/share/pixmaps/
	mkdir ${D}/usr/share/applications
	cat > ${D}/usr/share/applications/reconstructor.desktop << _EOF
	[Desktop Entry]
	Version=1.0
	Encoding=UTF-8
	Name=Reconstructor
	Type=Application
	Exec=sudo /usr/bin/reconstructor
	Icon=/usr/share/pixmaps/reconstructor.png
	X-GNOME-DocPath=
	Terminal=true
	Categories=GNOME;GTK;Application;System;
	Name[en]=Reconstructor
	GenericName[en]=Reconstructor
	Comment[en]=Ubuntu CD Creator
	GenericName=Reconstructor
	Comment=Ubuntu CD Creator
	GenericName[en_US]=Reconstructor

_EOF
	
	cat > ${D}/usr/bin/reconstructor << _EOF
	#!/bin/bash
	cd /usr/share/reconstructor

	sudo python reconstructor.py

_EOF
	chmod a+x ${D}/usr/bin/reconstructor
}
