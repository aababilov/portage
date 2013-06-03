# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="GRUB extras"
HOMEPAGE=""

KEYWORDS="amd64 ppc ppc64 x86"
LICENSE="GPL-3"
SLOT="0"

DEPEND="sys-boot/os-prober
	>=sys-boot/grub-2"

S="${WORKDIR}"

src_install() {
	exeinto /etc/grub.d
	doexe "${FILESDIR}"/05_debian_theme
	exeinto /usr/lib/linux-boot-probes/mounted
	doexe "${FILESDIR}"/80linux
	exeinto /usr/sbin
	doexe "${FILESDIR}"/update-grub2
}