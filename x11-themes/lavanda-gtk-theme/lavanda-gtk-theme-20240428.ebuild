# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs edo xdg

MY_PN="${PN^}"
MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}" # eg. 20211225 -> 2021-12-25

DESCRIPTION="Lavanda theme for GTK+ based desktop environments"
HOMEPAGE="https://github.com/vinceliuice/Lavanda-gtk-theme"


SRC_URI="https://github.com/vinceliuice/Lavanda-gtk-theme/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 arm64 ppc64"
S="${WORKDIR}/${MY_PN}-${MY_PV}"


LICENSE="GPL-3+"
SLOT="0"
RESTRICT="binchecks strip test"

BDEPEND="
	app-shells/bash
	dev-lang/sassc
"

DOCS=(
	README.md
	LICENSE
)

pkg_setup() {
	CHECKREQS_DISK_USR=260M
}

pkg_pretend() {
	pkg_setup
}

src_prepare() {
	default
}

src_install() {
	einstalldocs

	dodir /usr/share/themes
	edob ./install.sh -i gentoo -d "${ED}/usr/share/themes"
}
