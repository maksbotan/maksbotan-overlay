# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

#EGIT_REPO_URI="/home/maks/sssd-${PV}/.git"
PYTHON_DEPEND="python? *:2.4"

inherit autotools python confutils multilib pam #git

DESCRIPTION="System Security Services Daemon - provide access to identity and authentication"
HOMEPAGE="http://fedorahosted.org/sssd/"
SRC_URI="http://fedorahosted.org/released/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="trace doc test python selinux nscd locator openssl keyutils dbus semanage"

DEPEND="
	test? ( dev-libs/check )
	dev-libs/popt
	sys-libs/talloc
	sys-libs/tdb
	sys-libs/tevent
	sys-libs/ldb
	net-nds/openldap
	dev-libs/libpcre
	app-crypt/mit-krb5
	net-dns/c-ares
	doc? (
		dev-libs/libxslt
		dev-libs/libxml2
		app-doc/doxygen
	)
	openssl? ( dev-libs/openssl )
	!openssl? ( dev-libs/nss )
	keyutils? ( sys-apps/keyutils )
	net-dns/bind-tools
	dev-libs/cyrus-sasl
	dbus? ( sys-apps/dbus )
	selinux? ( dev-libs/selinux )
	semanage? ( dev-libs/semanage )"
RDEPEND="${DEPEND}"

pkg_setup(){
	confutils_use_depend_all semanage selinux
}

src_prepare(){
	epatch "${FILESDIR}"/${PN}-gentoo-compatible.patch
	eautoreconf
}

src_configure(){
	econf \
		$(use trace && echo '--enable-trace=7') \
		--with-init-dir=/etc/init.d \
		--with-pid-path=/var/run \
		--enable-nsslibdir=/$(get_libdir) \
		--enable-pammoddir=$(getpam_mod_dir) \
		$(use_with python python-bindings) \
		$(use_with selinux) \
		$(use_with selinux semanage) \
		$(use_with nscd) \
		$(use_enable locator krb5-locator-plugin) \
		$(use_enable openssl crypto) \
		$(use_enable doc manpages) || die
}

src_install(){
	emake DESTDIR="${D}" install || die
}
