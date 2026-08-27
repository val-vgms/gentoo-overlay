# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs edo xdg

MY_PN="Layan-kde"
MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}" # eg. 20211225 -> 2021-12-25

DESCRIPTION="Colloid icon theme for linux desktops"
HOMEPAGE="https://github.com/vinceliuice/Layan-kde"


SRC_URI="https://github.com/vinceliuice/Layan-kde/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 arm64 ppc64"
S="${WORKDIR}/${MY_PN}-${MY_PV}"


LICENSE="GPL-3+"
SLOT="0"

BDEPEND="
	app-shells/bash
"

DOCS=(
	LICENSE
	README.md
	AUTHORS
	logo.png
)

pkg_setup() {
	CHECKREQS_DISK_USR=15M
}

pkg_pretend() {
	pkg_setup
}

src_prepare() {
	default
}

src_install() {
	einstalldocs

	dodir /usr/share/aurorae/themes
	dodir /usr/share/color-schemes
	dodir /usr/share/plasma/desktoptheme
	dodir /usr/share/plasma/layout-templates
	dodir /usr/share/plasma/look-and-feel
	dodir /usr/share/Kvantum
	dodir /usr/share/wallpapers

	sed -i 's,AURORAE_DIR=\"\/usr\/share\/aurorae\/themes\",AURORAE_DIR=\"'"${ED}"'\/usr\/share\/aurorae\/themes\",' ./install.sh
	sed -i 's,SCHEMES_DIR=\"\/usr\/share\/color-schemes\",SCHEMES_DIR=\"'"${ED}"'\/usr\/share\/color-schemes\",' ./install.sh
	sed -i 's,PLASMA_DIR=\"\/usr\/share\/plasma\/desktoptheme\",PLASMA_DIR=\"'"${ED}"'\/usr\/share\/plasma\/desktoptheme\",' ./install.sh
	sed -i 's,LAYOUT_DIR=\"\/usr\/share\/plasma\/layout-templates\",LAYOUT_DIR=\"'"${ED}"'\/usr\/share\/plasma\/layout-templates\",' ./install.sh
	sed -i 's,LOOKFEEL_DIR=\"\/usr\/share\/plasma\/look-and-feel\",LOOKFEEL_DIR=\"'"${ED}"'\/usr\/share\/plasma\/look-and-feel\",' ./install.sh
	sed -i 's,KVANTUM_DIR=\"\/usr\/share\/Kvantum\",KVANTUM_DIR=\"'"${ED}"'\/usr\/share\/Kvantum\",' ./install.sh
	sed -i 's,WALLPAPER_DIR=\"\/usr\/share\/wallpapers\",WALLPAPER_DIR=\"'"${ED}"'\/usr\/share\/wallpapers\",' ./install.sh

	edob ./install.sh
}
