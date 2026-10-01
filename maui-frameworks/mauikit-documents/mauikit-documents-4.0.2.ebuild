# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org

DESCRIPTION="MauiKit QtQuick plugins for text editing"
HOMEPAGE="https://mauikit.org/"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${P}.tar.gz"
SLOT="6"

# requires running environment
RESTRICT="test"

RDEPEND="
	app-text/poppler[qt6]
	>=dev-qt/qtbase-${QTMIN}:6
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kfilemetadata-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	maui-frameworks/mauikit
	maui-frameworks/mauikit-filebrowsing
	sys-devel/gcc
	sys-libs/glibc
"
BDEPEND="
	>=kde-frameworks/extra-cmake-modules-${KFMIN}:6
"
PATCHES="${FILESDIR}/add-qtquickprivate.patch"

src_unpack(){
    unpack ${A}
    mv ${WORKDIR}/${PN}-v${PV}*/ ${WORKDIR}/${P}
}

src_prepare() {
	ecm_src_prepare
}

src_configure() {
	ecm_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
}
