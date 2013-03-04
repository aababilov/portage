# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="git://github.com/paradoxxxzero/jinja2-mode.git"

inherit elisp git-2

DESCRIPTION="Jinja2 major mode."
HOMEPAGE="http://paradoxxxzero.github.com/jinja2-mode/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

S="${WORKDIR}/${PN}"
SITEFILE=50${PN}-gentoo.el

pkg_setup() {
	if [[ ${PV} == *9999* ]]; then
		elog
		elog "This is a live ebuild which installs the latest from upstream's"
		elog "git repository, and is unsupported by Gentoo."
		elog "Everything but bugs in the ebuild itself will be ignored."
		elog
	fi
}

src_compile() {
	elisp-compile ${PN}.el || die "elisp-compile failed"
}

src_install() {
	elisp-install ${PN} *.el *.elc
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc README
}

pkg_postinst() {
	elisp-site-regen
	elog "Add the following to your ~/.emacs to use jinja2-mode:"
	elog "	(autoload 'jinja2-mode "'"jinja2-mode" nil t)'
	elog "	(add-to-list 'auto-mode-alist '"'("\\.jinja2$" . jinja2-mode))'
}
