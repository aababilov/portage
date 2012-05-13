# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/tuxguitar-bin/tuxguitar-bin-3.6.15.ebuild,v 1.2 2011/03/06 18:58:40 hwoarang Exp $
EAPI="2"

inherit eutils  multilib

DESCRIPTION="TuxGuitar"
SRC_URI="amd64? ( http://google.com/tuxguitar-1.2-linux-x86_64.tar.gz )
         x86? ( http://google.com/tuxguitar-1.2-linux-x86.tar.gz ) "
HOMEPAGE="http://www.mozilla.com/firefox"

KEYWORDS="-* amd64 x86"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="app-arch/unzip"
RDEPEND="virtual/jre
	x86? (
		>=x11-libs/gtk+-2.2
                >=media-libs/alsa-lib-1.0.16
	)
	amd64? (
		>=app-emulation/emul-linux-x86-baselibs-20081109
		>=app-emulation/emul-linux-x86-gtklibs-20081109
		>=app-emulation/emul-linux-x86-soundlibs-20081109
	)"
        
use x86 && S="${WORKDIR}/tuxguitar-1.2-linux-x86" || S="${WORKDIR}/tuxguitar-1.2-linux-x86_64"

src_install() {
	# Install in /opt
	dodir /opt/tuxguitar
        insinto /opt/tuxguitar
        exeinto /opt/tuxguitar
        cd "${S}"
        doins -r doc lib share tuxguitar.jar
        doexe tuxguitar
        
        # Create /opt/bin/tuxguitar
	dodir /opt/bin/
	cat <<EOF >"${D}"/opt/bin/tuxguitar
#!/bin/sh
exec /opt/tuxguitar/tuxguitar "\$@"
EOF
	fperms 0755 /opt/bin/tuxguitar
}
