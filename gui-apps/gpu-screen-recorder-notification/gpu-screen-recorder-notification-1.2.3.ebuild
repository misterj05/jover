# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://repo.dec05eba.com/gpu-screen-recorder-notification"
else
	SRC_URI="
		https://dec05eba.com/snapshot/"${PN}".git."${PV}".tar.gz
			-> "${P}".tar.gz
	"
	S="${WORKDIR}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="ShadowPlay-like notifications for gpu-screen-recorder-ui."
HOMEPAGE="https://git.dec05eba.com/gpu-screen-recorder-notification/about"
LICENSE="GPL-3 OFL-1.1"
SLOT="0"

RDEPEND="
	"${DEPEND}"
"

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXext

	media-libs/libglvnd

	dev-libs/wayland
	dev-util/wayland-scanner
"

BDEPEND="
	"${DEPEND}"
"
