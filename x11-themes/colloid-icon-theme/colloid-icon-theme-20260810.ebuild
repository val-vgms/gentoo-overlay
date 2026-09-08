# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs edo xdg

MY_PN="${PN^}"
MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}" # eg. 20211225 -> 2021-12-25

DESCRIPTION="Colloid icon theme for linux desktops"
HOMEPAGE="https://github.com/vinceliuice/Colloid-icon-theme"


SRC_URI="https://github.com/vinceliuice/Colloid-icon-theme/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 arm64 ppc64"
S="${WORKDIR}/${MY_PN}-${MY_PV}"


LICENSE="GPL-3+"
SLOT="0"
IUSE="alt bold notint scheme_default scheme_nord scheme_dracula scheme_gruvbox scheme_everforest scheme_catppuccin scheme_all color_blue color_purple color_pink color_red color_orange color_yellow color_green color_teal color_grey color_all hardlink "
REQUIRED_USE="^^ ( scheme_default scheme_nord scheme_dracula scheme_gruvbox scheme_everforest scheme_catppuccin scheme_all )"
REQUIRED_USE="^^ ( color_blue color_purple color_pink color_red color_orange color_yellow color_green color_teal color_grey color_all )"
RESTRICT="binchecks strip test"

BDEPEND="
	app-shells/bash
"

DOCS=(
	LICENSE
	README.md
	preview.png
	folders.png
	schemes.png
)

pkg_setup() {
	CHECKREQS_DISK_USR=2600M
}

pkg_pretend() {
	pkg_setup
}

src_prepare() {
	default

	# We use eclass for that.
	sed -i "/gtk-update-icon-cache/d" install.sh || die
}

src_install() {
	einstalldocs

	dodir /usr/share/icons

	local options=()

	use alt && options+=( -a )
	use bold && options+=( -b )
	use notint && options+=( --notint )
	use scheme_default && options+=( -s default )
	use scheme_nord && options+=( -s nord )
	use scheme_dracula && options+=( -s dracula )
	use scheme_gruvbox && options+=( -s gruvbox )
	use scheme_everforest && options+=( -s everforest )
	use scheme_catppuccin && options+=( -s catppuccin )
	use scheme_all && options+=( -s all )
	use color_blue && options+=( -t default )
	use color_purple && options+=( -t purple )
	use color_pink && options+=( -t pink )
	use color_red && options+=( -t red )
	use color_orange && options+=( -t orange )
	use color_yellow && options+=( -t yellow )
	use color_green && options+=( -t green )
	use color_teal && options+=( -t teal )
	use color_grey && options+=( -t grey )
	use color_all && options+=( -t all )

	edob ./install.sh -d "${ED}/usr/share/icons" "${options[@]}"

	use hardlink && \
		edob -m "Linking duplicate icons" hardlink -pot "${ED}/usr/share/icons"

	# Installs broken symlinks (by design, but we remove it due to QA warnings).
	# https://bugs.gentoo.org/830467
	edob -m "Removing broken symlinks" find "${ED}" -xtype l -print -delete
}
