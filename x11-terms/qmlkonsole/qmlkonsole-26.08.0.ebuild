# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org

DESCRIPTION="Terminal app for Plasma Mobile"
HOMEPAGE="https://apps.kde.org/qmlkonsole/"
KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
SRC_URI="https://invent.kde.org/plasma-mobile/${PN}/-/archive/v${PV}/${P}.tar.gz"

LICENSE="GPL-2.0-or-later"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"

DEPEND="
sys-libs/glibc
>=kde-frameworks/kconfig-${KFMIN}
>=kde-frameworks/kcoreaddons-${KFMIN}
>=kde-frameworks/ki18n-${KFMIN}
>=kde-frameworks/kirigami-${KFMIN}
dev-libs/kirigami-addons
>=kde-frameworks/kpty-${KFMIN}
>=kde-frameworks/kwindowsystem-${KFMIN}
>=dev-qt/qt5compat-${QTMIN}
>=dev-qt/qtbase-${QTMIN}
>=dev-qt/qtdeclarative-${QTMIN}
"

RDEPEND="${DEPEND}"

BDEPEND="kde-frameworks/extra-cmake-modules"

src_unpack(){
    unpack ${A}
    mv ${WORKDIR}/${PN}-v${PV}*/ ${WORKDIR}/${P}
}

src_prepare(){
    ecm_src_prepare
}

src_compile(){
    ecm_src_compile
}

src_install(){
    ecm_src_install
}
