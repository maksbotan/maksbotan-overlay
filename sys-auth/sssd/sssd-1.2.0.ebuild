# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools

DESCRIPTION="System Security Services Daemon -  provide access to identity and authentication"
HOMEPAGE="https://fedorahosted.org/sssd"
SRC_URI="https://fedorahosted.org/released/sssd/sssd-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="trace doc python selinux aux-info lpad sqlite3 man"

DEPEND=">sys-libs/glibc-2.4
	>sys-kernel/linux-headers-2.6.11
	sys-libs/talloc[compat]
	sys-libs/tdb[tools]
	sys-libs/tevent
	sys-libs/ldb[ldap?,sqlite3?]
	net-nds/openldap
	sys-devel/gettext
	dev-libs/libpcre[cxx,unicode]
	net-dns/c-ares
	sys-apps/dbus
	dev-libs/libxslt
	doc? ( app-text/docbook-xsl-stylesheets 
		app-doc/doxygen
	)
	app-crypt/mit-krb5
	dev-libs/libxml2
	sys-libs/pam
	dev-libs/nss[utils]
	dev-libs/popt
	sys-apps/keyutils"
RDEPEND="${DEPEND}"

S=${WORKDIR}/sssd-${PV}

src_configure() {
	econf \
		$(use_enable trace) \
		$(use_with man manpages) \
		$(use_with python python-binding) \
		$(use_with selinux selinux) \
		$(use_with selinux semanage) || die
}

src_install() {
	emake DESTDIR=${D} install || die
}
