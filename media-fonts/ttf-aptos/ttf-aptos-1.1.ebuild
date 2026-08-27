# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FONT_SUFFIX="ttf"
inherit font readme.gentoo-r1

DESCRIPTION="The new default Microsoft 365 font, used by Microsoft"
HOMEPAGE="https://learn.microsoft.com/en-us/typography/font-list/aptos"
SRC_URI="https://download.microsoft.com/download/8/6/0/860a94fa-7feb-44ef-ac79-c072d9113d69/Microsoft%20Aptos%20Fonts.zip -> ${P}.zip"

LICENSE="MS-EULA"
SLOT="0"
KEYWORDS="amd64 arm64 loong riscv x86"
RESTRICT="bindist mirror"

FONT_SUFFIX="ttf"

src_unpack(){
	unpack ${A}
	mkdir ${WORKDIR}/${P} || die
	cp ${WORKDIR}/* ${WORKDIR}/${P}/
}