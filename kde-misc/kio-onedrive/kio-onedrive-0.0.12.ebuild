# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.27.0
QTMIN=6.11.2
inherit ecm gear.kde.org

DESCRIPTION="KIO worker for OneDrive service"
HOMEPAGE="https://invent.kde.org/bernardogn/kio-onedrive"
SRC_URI="https://invent.kde.org/bernardogn/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"

LICENSE="GPL-2+"
KEYWORDS="~amd64 ~arm64"
SLOT="0"
KDE_ORG_CATEGORY="network"

DEPEND="
    >=kde-frameworks/kconfig-${KFMIN}
    >=kde-frameworks/kcoreaddons-${KFMIN}
    >=kde-apps/kaccounts-integration-26
    >=kde-apps/kaccounts-providers-26
    >=kde-frameworks/ki18n-${KFMIN}
    >=kde-frameworks/kio-${KFMIN}
	>=kde-frameworks/knotifications-${KFMIN}
	>=kde-frameworks/purpose-${KFMIN}
    >=dev-qt/qtbase-${QTMIN}
"

RDEPEND="${DEPEND}"

BDEPEND="kde-frameworks/extra-cmake-modules"
S="${WORKDIR}/${PN}-v${PV}"

src_configure() {
    export CC=clang
    export CXX=clang++
	ecm_src_configure
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
