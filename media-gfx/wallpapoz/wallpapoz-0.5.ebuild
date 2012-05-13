# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Gnome Desktop Wallpapers Configuration Tool"
HOMEPAGE="http://wallpapoz.akbarhome.com"
SRC_URI="http://wallpapoz.akbarhome.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/pygtk
	dev-python/imaging
	dev-python/gnome-python"
DEPEND="${RDEPEND}"

# strange non-standard setup.py stuff is going on here...
src_compile() {
	echo "Nothing to do."
}

src_install() {
	dodir /usr
	python setup.py --installdir "${D}/usr" install || die
	dodoc CHANGELOG README
}
