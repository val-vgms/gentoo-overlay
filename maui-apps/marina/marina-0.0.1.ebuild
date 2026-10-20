# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org

DESCRIPTION="Marina is a QML-based dock designed for Nitrux."
HOMEPAGE="https://github.com/Nitrux/marina"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
SRC_URI="https://github.com/Nitrux/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="6"
S="${WORKDIR}/${PN}-${PV}"

# requires running environment
RESTRICT="test"

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6
	kde-plasma/layer-shell-qt
	maui-frameworks/mauikit
	sys-devel/gcc
	sys-libs/glibc
"
BDEPEND="
	>=kde-frameworks/extra-cmake-modules-${KFMIN}:6
"

src_prepare() {
	ecm_src_prepare
}

src_configure() {
	ecm_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
}
