# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Lingvo Stardict dictionaries"
SRC_URI="lingvo-stardict-3.tar.gz"

LICENSE="EULA"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
DICTIONARIES="de-de de-ru economicus-en-ru en-en en-ru en-uk es-ru fr-ru it-ru ru-de ru-en ru-es ru-fr ru-it ru-ru ru-uk uk-en uk-ru uk-uk"
SOUNDS="sound-de sound-en sound-fr"
IUSE="$DICTIONARIES $SOUNDS all-dicts all-sounds"

RDEPEND=""
DEPEND="${RDEPEND}
	app-text/stardict
"

src_install() {
    insinto /usr/share/stardict/dic
    for i in ${DICTIONARIES}; do
        if ! (use $i || use all-dicts); then
            continue
        fi
        case $i in
            economicus-en-ru)
                doins -r EconomicusEnRu
                ;;
            de-de)
                doins -r CompactVerlagDeDe
                ;;
            *)
                subdir=$(echo $i | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2, 1) toupper(substr($0, 4, 1)) substr($0, 5, 1) }')
                doins -r $subdir
                ;;
        esac
    done
    insinto /usr/share/stardict/sounds
    for i in ${SOUNDS}; do
        if ! (use $i || use all-sounds); then
            continue
        fi
        subdir=$(echo ${i#sound-} | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2, 1) }')
        doins -r sound/Sound_${subdir}
    done
}
