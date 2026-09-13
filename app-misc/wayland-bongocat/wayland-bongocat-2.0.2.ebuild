# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Bongocat for your desktop ₍^. .^₎"
HOMEPAGE="https://github.com/saatvik333/wayland-bongocat"
SRC_URI="https://github.com/saatvik333/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2+"
KEYWORDS="amd64 arm64"
SLOT="0"
KDE_ORG_CATEGORY="network"

DEPEND="dev-libs/wayland"

RDEPEND="${DEPEND}"

BDEPEND="
    dev-build/make
    sys-devel/gcc"
S="${WORKDIR}/${PN}-${PV}"

src_compile(){
    cd "${S}"
    make release
}

src_install(){
    cd "${S}"
    install -Dm755 build/bongocat "${D}/usr/bin/bongocat"
    install -Dm755 scripts/find_input_devices.sh "${D}/usr/bin/bongocat-find-devices"
    install -Dm644 LICENSE "${D}/usr/share/licenses/${PN}/LICENSE"
    install -Dm644 bongocat.conf.example "${D}/usr/share/doc/${PN}/bongocat.conf.example"
    install -Dm644 man/bongocat.1 "${D}/usr/share/man/man1/bongocat.1"
}