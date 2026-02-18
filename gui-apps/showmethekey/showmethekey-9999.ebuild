# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AlynxZhou/showmethekey"
else
	RESTRICT="mirror"
	KEYWORDS="~amd64"
	SRC_URI="
		https://github.com/AlynxZhou/showmethekey/archive/v"${PV}".tar.gz
			-> "${P}".tar.gz
	"
fi

DESCRIPTION="Show keys you typed on screen."
HOMEPAGE="https://showmethekey.alynx.one/"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND="
	dev-libs/glib
	dev-libs/json-glib
	dev-libs/libevdev
	dev-libs/libinput
	dev-util/gtk-update-icon-cache
	gui-libs/gtk:4
	gui-libs/libadwaita
	virtual/udev
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
"

RDEPEND="
	"${DEPEND}"
	x11-libs/libX11
"

src_prepare() {
	default
	sed -i 's/gtk4-update-icon-/gtk-update-icon-/g' meson.build || die
}
