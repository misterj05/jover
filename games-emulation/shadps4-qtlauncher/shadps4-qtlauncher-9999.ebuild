# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

JSON_COMMIT="54be9b04f0ec65d0bcfe0da54e7f01ea86fbfc3e"
VOLK_COMMIT="e51c647181c7a8101454e69446079bc34100a320"
VULKANHEADERS_COMMIT="33d7f512583b8de44d1b6384aa1cf482f92e53e9"

DESCRIPTION="The Official Qt Launcher for shadps4"
HOMEPAGE="https://shadps4.net/"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/shadps4-emu/shadps4-qtlauncher"
	EGIT_MIN_CLONE_TYPE="single"
	EGIT_SUBMODULES=('*')
else
	RESTRICT="mirror"
	KEYWORDS="~amd64"
	S="${WORKDIR}"/"${PN}"-v."${PV}"
	SRC_URI="
		https://github.com/shadps4-emu/shadps4-qtlauncher/archive/v."${PV}".tar.gz
			-> "${P}".tar.gz
		https://github.com/nlohmann/json/archive/"${JSON_COMMIT}".tar.gz
			-> "${PN}"-json-"${JSON_COMMIT}".tar.gz
		https://github.com/zeux/volk/archive/"${VOLK_COMMIT}".tar.gz
			-> "${PN}"-volk-"${VOLK_COMMIT}".tar.gz
		https://github.com/KhronosGroup/Vulkan-Headers/archive/"${VULKANHEADERS_COMMIT}".tar.gz
			-> "${PN}"-vulkanheaders-"${VULKANHEADERS_COMMIT}".tar.gz
	"
fi

LICENSE="GPL-2+ MIT Boost-1.0"
SLOT="0"

RDEPEND="
	"${DEPEND}"
	x11-themes/hicolor-icon-theme
"

DEPEND="
	>=dev-libs/libfmt-10.2.0
	dev-libs/pugixml
	media-libs/libsdl3

	dev-qt/qtbase:6[widgets,concurrent,gui,network]
	dev-qt/qtmultimedia:6[ffmpeg]
	dev-qt/qttools:6[widgets,linguist]
	dev-libs/openssl
"

BDEPEND="
	dev-cpp/toml11
"

src_prepare() {
	if [[ "${PV}" != 9999 ]]; then
		rmdir "${S}"/externals/json || die
		mv "${WORKDIR}"/json-"${JSON_COMMIT}" "${S}"/externals/json || die

		rmdir "${S}"/externals/volk || die
		mv "${WORKDIR}"/volk-"${VOLK_COMMIT}" "${S}"/externals/volk || die

		rmdir "${S}"/externals/vulkan-headers || die
		mv "${WORKDIR}"/Vulkan-Headers-"${VULKANHEADERS_COMMIT}" "${S}"/externals/vulkan-headers || die
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_UPDATER=no
	)

	cmake_src_configure
}

pkg_postinst() {
	elog " "
	elog "shadps4-qtlauncher uses AppImage binaries by default."
	elog " "
	elog "To use your own compiled build of shadps4, emerge \"games-emulation/shadps4\""
	elog "and in the version manager select \"Add Custom\" and add the shadps4 binary."
	elog "It should be located at \"/usr/bin/shadps4\"."
	elog " "
}
