# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://repo.dec05eba.com/gpu-screen-recorder-ui"
else
	SRC_URI="
		https://dec05eba.com/snapshot/"${PN}".git."${PV}".tar.gz
			-> "${P}".tar.gz
	"
	S="${WORKDIR}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="ShadowPlay-like frontend for gpu-screen-recorder."
HOMEPAGE="https://git.dec05eba.com/gpu-screen-recorder-ui/about"
LICENSE="GPL-3 OFL-1.1 CC-BY-SA-3.0 CC0-1.0 CC-BY-4.0"
SLOT="0"
IUSE="+suid"

RDEPEND="
	"${DEPEND}"
	media-video/gpu-screen-recorder
	gui-apps/gpu-screen-recorder-notification
"

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXcomposite
	x11-libs/libXfixes
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXcursor

	media-libs/libglvnd[X]

	media-libs/libpulse

	x11-libs/libdrm

	dev-libs/wayland
	dev-util/wayland-scanner

	sys-libs/libcap
"

BDEPEND="
	"${DEPEND}"
"

src_configure() {
	local emesonargs=(
		$(meson_use suid capabilities)
	)
	meson_src_configure
}

pkg_postinst() {
	ewarn "If you don't want to start gsr-ui on every boot read below to setup autostart:"
	ewarn " "
	ewarn "Desktop Environment (DE): Launch program normally via desktop entry,"
	ewarn "enable \"Start program on system startup?\" in the settings menu."
	ewarn " "
	ewarn "Window Manager (WM): You need to add the command \"gsr-ui launch-daemon\" into the"
	ewarn "init of your WM of choice."
}
