# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils python

MY_PN="Scrapy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A high-level Python Screen Scraping framework"
HOMEPAGE="http://scrapy.org http://pypi.python.org/pypi/Scrapy/"
SRC_URI="mirror://pypi/S/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc examples"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND="dev-python/lxml
	dev-python/simplejson
	dev-python/twisted
	dev-python/twisted-conch
	dev-python/twisted-mail
	dev-python/twisted-web"

S="${WORKDIR}/${MY_P}"

src_compile() {
	distutils_src_compile
	cd docs
	emake html || die "emake html failed"
	cd "${S}"
}

src_install() {
	distutils_src_install
	if use doc; then
		dohtml -r "${S}"/docs/build/html/ || die "dohtml failed"
	fi
	if use examples; then
		insinto /usr/share/doc/"${PF}"/examples
		doins -r "${S}"/examples/* || die "doins failed"
	fi
}
