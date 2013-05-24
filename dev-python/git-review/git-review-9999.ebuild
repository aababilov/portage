# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

EGIT_REPO_URI="git://github.com/openstack-infra/git-review.git"

inherit git-2 distutils-r1

MY_PN="git-review"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Tool to submit code to Gerrit"
HOMEPAGE="http://pypi.python.org/pypi/${MY_PN}"
[[ ${PV} == *9999* ]] || \
	SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="${RDEPEND}
	dev-vcs/git"

S="${WORKDIR}/${MY_P}"
