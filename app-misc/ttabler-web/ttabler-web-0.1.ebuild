# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit eutils distutils

MY_PN="ttabler-web"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A web interace to ttabler"
HOMEPAGE="http://pypi.python.org/pypi/ttabler-web"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/flask
	dev-python/setuptools
	dev-python/flask-sqlalchemy"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

PYTHON_MODNAME="ttabler_web"


pkg_setup() {
	enewgroup ttabler-web
	enewuser ttabler-web -1 -1 /var/lib/ttabler-web ttabler-web
}

src_install() {
	distutils_src_install

	local gentoodir="${WORKDIR}/${GDM_EXTRA}"

	# log, etc.
	keepdir /var/{lib,log}/ttabler-web
	fowners -R ttabler-web:ttabler-web /var/{lib,log}/ttabler-web
	fperms 775 /var/{lib,log}/ttabler-web
}
