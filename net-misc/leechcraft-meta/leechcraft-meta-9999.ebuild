# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Meta ebuild for installing all leechcraft-plugins."

HOMEPAGE="http://leechcraft.org/"

LICENSE="GPL-3"
SLOT="0"

IUSE="autoscreenshot +crashhandler kinotify dbus import +tab networkmonitor
+bittorrent +ftp
+history +rss deadlyrics +browser vgrabber opensearch"

KEYWORDS=""

RDEPEND="=net-misc/leechcraft-cstp-${PV}
		=net-misc/leechcraft-core-${PV}
		=net-misc/leechcraft-summary-${PV}
		autoscreenshot? ( =net-misc/leechcraft-auscrie-${PV} )
		crashhandler? ( =net-misc/leechcraft-anhero-${PV} )
		kinotify? ( =net-misc/leechcraft-kinotify-${PV} )
		import? ( =net-misc/leechcraft-newlife-${PV} )
		tab? ( =net-misc/leechcraft-tabpp-${PV} )
		networkmonitor? ( =net-analyzer/leechcraft-networkmonitor-${PV} )
		bittorrent? ( =net-p2p/leechcraft-bittorrent-${PV} )
		ftp? ( =net-ftp/leechcraft-lcftp-${PV} )
		history? ( =net-misc/leechcraft-historyholder-${PV} )
		rss? ( =net-news/leechcraft-aggregator-${PV} )
		deadlyrics? ( =www-client/leechcraft-deadlyrics-${PV} )
		browser? ( =www-client/leechcraft-poshuku-${PV} )
		vgrabber? ( =www-client/leechcraft-vgrabber-${PV} )
		opensearch? ( =www-misc/leechcraft-seekthru-${PV} )
		dbus? ( =net-misc/leechcraft-dbusmanager-${PV} )
		"
DEPEND=""
