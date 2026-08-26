# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs edo xdg

MY_PN="${PN^}"
MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}" # eg. 20211225 -> 2021-12-25

DESCRIPTION="Colloid icon theme for linux desktops"
HOMEPAGE="https://github.com/vinceliuice/Layan-cursors"


SRC_URI="https://github.com/vinceliuice/Layan-cursors/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
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
	preview.png
	preview-border.png
	preview-white.png
	preview.png
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

	dodir /usr/share/icons

	sed -i 's,DEST_DIR=\"\/usr\/share\/icons\",DEST_DIR=\"'"${ED}"'\/usr\/share\/icons\/\",' ./install.sh

	edob ./install.sh
}
