# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Handheld Daemon. A tool for managing the quirks of handheld devices."
HOMEPAGE="https://github.com/hhd-dev/hhd"
SRC_URI="https://github.com/hhd-dev/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.1-or-later"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd openrc"

inherit udev

DEPEND="
dev-lang/python
dev-python/setuptools
dev-python/evdev
dev-python/rich
dev-python/pyyaml
dev-python/python-xlib
dev-python/dbus-python
dev-libs/libusb
dev-python/pyserial
sys-process/lsof
dev-python/pyroute2
dev-python/pygobject
dev-libs/hidapi
"

RDEPEND="${DEPEND}"

BDEPEND="
dev-python/build
dev-python/installer
dev-python/setuptools
dev-python/wheel
dev-python/babel
dev-libs/hidapi"

src_compile(){
    pybabel compile -D hhd -d ./i18n
    pybabel compile -D adjustor -d ./i18n || true
    cp -rf ./i18n/* ./src/hhd/i18n
    python -m build --wheel --no-isolation
}

src_install(){
    python -m installer --destdir="${D}" dist/*.whl
    udev_dorules usr/lib/udev/rules.d/83-hhd.rules
    udev_dorules usr/lib/udev/hwdb.d/83-hhd.hwdb
    if use systemd; then
        mkdir -p ${D}/usr/lib/systemd/system/
        mkdir -p ${D}/usr/lib/systemd/user/
        mkdir -p ${D}/usr/lib/modules-load.d/
        install -m644 usr/lib/systemd/system/hhd@.service ${D}/usr/lib/systemd/system/hhd@.service
        install -m644 usr/lib/systemd/system/hhd.service ${D}/usr/lib/systemd/system/hhd.service
        install -m644 ${FILESDIR}/hhd-user.conf ${D}/usr/lib/modules-load.d/hhd-user.conf
        udev_dorules ${FILESDIR}/83-hhd-user.rules
        install -m644 ${FILESDIR}/hhd-user.service ${D}/usr/lib/systemd/user/hhd-user.service
    fi
    if use openrc; then
        mkdir -p ${D}/etc/users/init.d/
        install -m644 ${FILESDIR}/hhd-user ${D}/etc/users/init.d/hhd-user
    fi
}

pkg_postinst() {
    udev_reload
    udev_hwdb_update
}

pkg_postrm() {
    udev_reload
    udev_hwdb_update
}
