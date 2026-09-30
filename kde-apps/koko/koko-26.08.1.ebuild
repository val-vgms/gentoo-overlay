# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org optfeature xdg

DESCRIPTION="Image viewer by KDE"
HOMEPAGE="https://apps.kde.org/koko/ https://userbase.kde.org/Photos"

LICENSE="GPL-2+ handbook? ( FDL-1.2 )"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
SRC_URI="https://invent.kde.org/plasma-mobile/${PN}/-/archive/v${PV}/${P}.tar.gz"
IUSE="X"
SLOT="6"

# requires running environment
RESTRICT="test"

COMMON_DEPEND="
	dev-libs/wayland
	dev-libs/kirigami-addons
	dev-libs/kirigami-app-components
	>=dev-qt/qtbase-${QTMIN}:6=[gui,opengl,wayland,widgets,dbus]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtpositioning-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kdeclarative-${KFMIN}:6
	>=kde-frameworks/kfilemetadata-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	media-gfx/exiv2:=
	media-libs/kquickimageeditor
	sys-libs/glibc
	X? (
		>=dev-qt/qtbase-${QTMIN}:6=[X]
		x11-libs/libX11
		x11-libs/libxcb
	)
"
DEPEND="${COMMON_DEPEND}
	dev-libs/wayland-protocols
	>=dev-qt/qtbase-${QTMIN}:6[concurrent]
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
"
RDEPEND="${COMMON_DEPEND}
	>=dev-qt/qtimageformats-${QTMIN}:6
	>=kde-apps/thumbnailers-${PVCUT}:6
"
BDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[wayland]
	dev-util/wayland-scanner
	>=kde-frameworks/extra-cmake-modules-${KFMIN}:6
"

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
