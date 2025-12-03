# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DreamMaoMao/mangowc"
else
	RESTRICT="mirror"
	KEYWORDS="~amd64"
	SRC_URI="
		https://github.com/DreamMaoMao/mangowc/archive/"${PV}".tar.gz
			-> "${P}".tar.gz
	"
fi

DESCRIPTION="A Wayland compositor based on wlroots and scenefx"
HOMEPAGE="https://github.com/DreamMaoMao/mangowc"
LICENSE="GPL-3+ MIT CC0-1.0"
SLOT="0"
IUSE="X"

COMMON_DEPEND="
	>=gui-libs/wlroots-0.19:=[libinput,session,X?]
	<gui-libs/wlroots-0.20:=[X?]
"

COMMON_DEPEND+="
	>=gui-libs/scenefx-0.4.1

	dev-libs/libinput:=
	dev-libs/wayland
	dev-libs/libpcre2
	x11-libs/libxkbcommon
	X? (
		x11-libs/libxcb:=
		x11-libs/xcb-util-wm
	)
"

RDEPEND="
	"${COMMON_DEPEND}"
	X? (
		x11-base/xwayland
	)
"

# uses <linux/input-event-codes.h>
DEPEND="
	"${COMMON_DEPEND}"
	sys-kernel/linux-headers
"

BDEPEND="
	>=dev-libs/wayland-protocols-1.45
	>=dev-util/wayland-scanner-1.24
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		$(meson_feature X xwayland)
	)
	meson_src_configure
}
