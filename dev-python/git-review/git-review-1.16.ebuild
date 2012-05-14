# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

MY_PN="git-review"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Tool to submit code to Gerrit"
HOMEPAGE="http://pypi.python.org/pypi/${MY_PN}"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="${RDEPEND}
	dev-vcs/git"

S="${WORKDIR}/${MY_P}"
