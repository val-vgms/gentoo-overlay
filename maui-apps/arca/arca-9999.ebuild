# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org xdg git-r3

DESCRIPTION="Calendar application built with MauiKit."
HOMEPAGE="https://github.com/Nitrux/maui-arca https://mauikit.org/apps/arca"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
EGIT_REPO_URI="https://github.com/Nitrux/maui-arca.git"
SLOT="6"

# requires running environment
RESTRICT="test"

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6
	>=dev-qt/qtdeclarative-${QTMIN}:6
	kde-apps/akonadi
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	maui-frameworks/mauikit
	maui-frameworks/mauikit-calendar
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
