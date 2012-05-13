# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="Performance Application Programming Interface"
HOMEPAGE="http://icl.cs.utk.edu/papi/"
SRC_URI="http://icl.cs.utk.edu/projects/papi/downloads/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="debug"

#DEPEND=">=dev-util/perfctr-2.6.37"
DEPEND=
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}/src

src_compile() {
	local myconf
	if use debug; then
		myconf="${myconf} --with-debug=yes"
		DBG="-g -Wall"
	else
		myconf="${myconf} --with-debug=yes"
		DBG="-g0"
	fi
	econf DBG=${DBG} ${myconf} \
		--with-perfctr-incdir=/usr/include \
		--with-perfctr-libdir=/usr/$(get_libdir) \
		--with-perfctr-prefix=/usr \
		|| die "econf failed"
	emake DBG=${DBG} || die "emake failed"
}

src_install() {
	dodir /usr/$(get_libdir)
	# there's something wrong inside those makefiles,
	# so lets use the old and ugly way
	emake \
		DESTDIR="${D}" \
		LIBDIR="/usr/$(get_libdir)" \
		MANDIR="/usr/share/man" \
		install || die "install failed"
}

src_test() {
	emake check
	emake test || die "initial test failed"
	#if use fulltest; then
	#	./run_tests.sh || ewarn "some tests failed, continuing anyway"
	#fi
}
