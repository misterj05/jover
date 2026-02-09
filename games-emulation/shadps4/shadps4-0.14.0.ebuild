# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg optfeature

CLI11_COMMIT="bf5a16a26a34a9a7ad75f4a7705585e44675fef0"
LIBATRAC9_COMMIT="ec8899dadf393f655f2871a94e0fe4b3d6220c9a"
FDKAAC_COMMIT="ee76460efbdb147e26d804c798949c23f174460b"
DEARIMGUI_COMMIT="f4d9359095eff3eb03f685921edc1cf0e37b1687"
DISCORDRPC_COMMIT="19f66e6dcabb2268965f453db9e5774ede43238f"
LIBUSB_COMMIT="c4d237a5803900b78dcc2961d057fcc8a678d3fd"
GLSLANG_COMMIT="ba1640446f3826a518721d1f083f3a8cca1120c3"
HWINFO_COMMIT="351c59828a79958f74f3ccab5e7773ffd724f6f7"
JSON_COMMIT="55f93686c01528224f448c19128836e7df245f72"
MAGICENUM_COMMIT="a413fcc9c46a020a746907136a384c227f3cd095"
MINIZ_COMMIT="174573d60290f447c13a2b1b3405de2b96e27d6c"
SDL_COMMIT="bdb72bb3f051de32c91f5deb439a50bfd51499dc"
SDLMIXER_COMMIT="4182794ea45fe28568728670c6f1583855d0e85c"
SIRIT_COMMIT="282083a595dcca86814dedab2f2b0363ef38f1ec"
TRACY_COMMIT="143a53d1985b8e52a7590a0daca30a0a7c653b42"
VMA_COMMIT="f378e7b3f18f6e2b06b957f6ba7b1c7207d2a536"
VULKANHEADERS_COMMIT="33d7f512583b8de44d1b6384aa1cf482f92e53e9"
XBYAK_COMMIT="44a72f369268f7d552650891b296693e91db86bb"
ZYDIS_COMMIT="120e0e705f8e3b507dc49377ac2879979f0d545c"
ZYCORE_COMMIT="38d4f0285e6157ee840ea82a9b90aba71c8a705d"

DESCRIPTION="PlayStation 4 emulator"
HOMEPAGE="https://shadps4.net/"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/shadps4-emu/shadPS4"
	EGIT_MIN_CLONE_TYPE="single"
	EGIT_SUBMODULES=('*')
else
	RESTRICT="mirror"
	KEYWORDS="~amd64"
	S="${WORKDIR}"/shadPS4-v."${PV}"
	SRC_URI="
		https://github.com/shadps4-emu/shadPS4/archive/v."${PV}".tar.gz
			-> "${P}".tar.gz
		https://github.com/shadexternals/CLI11/archive/"${CLI11_COMMIT}".tar.gz
			-> "${PN}"-cli11-"${CLI11_COMMIT}".tar.gz
		https://github.com/shadps4-emu/ext-LibAtrac9/archive/"${LIBATRAC9_COMMIT}".tar.gz
			-> "${PN}"-libatrac9-"${LIBATRAC9_COMMIT}".tar.gz
		https://github.com/mstorsjo/fdk-aac/archive/"${FDKAAC_COMMIT}".tar.gz
			-> "${PN}"-fdkaac-"${FDKAAC_COMMIT}".tar.gz
		https://github.com/shadps4-emu/ext-imgui/archive/"${DEARIMGUI_COMMIT}".tar.gz
			-> "${PN}"-dearimgui-"${DEARIMGUI_COMMIT}".tar.gz
		https://github.com/shadps4-emu/ext-discord-rpc/archive/"${DISCORDRPC_COMMIT}".tar.gz
			-> "${PN}"-discordrpc-"${DISCORDRPC_COMMIT}".tar.gz
		https://github.com/shadps4-emu/ext-libusb/archive/"${LIBUSB_COMMIT}".tar.gz
			-> "${PN}"-libusb-"${LIBUSB_COMMIT}".tar.gz
		https://github.com/KhronosGroup/glslang/archive/"${GLSLANG_COMMIT}".tar.gz
			-> "${PN}"-glslang-"${GLSLANG_COMMIT}".tar.gz
		https://github.com/shadps4-emu/ext-hwinfo/archive/"${HWINFO_COMMIT}".tar.gz
			-> "${PN}"-hwinfo-"${HWINFO_COMMIT}".tar.gz
		https://github.com/nlohmann/json/archive/"${JSON_COMMIT}".tar.gz
			-> "${PN}"-json-"${JSON_COMMIT}".tar.gz
		https://github.com/Neargye/magic_enum/archive/"${MAGICENUM_COMMIT}".tar.gz
			-> "${PN}"-magicenum-"${MAGICENUM_COMMIT}".tar.gz
		https://github.com/richgel999/miniz/archive/"${MINIZ_COMMIT}".tar.gz
			-> "${PN}"-miniz-"${MINIZ_COMMIT}".tar.gz
		https://github.com/shadexternals/sdl3/archive/"${SDL_COMMIT}".tar.gz
			-> "${PN}"-sdl-"${SDL_COMMIT}".tar.gz
		https://github.com/libsdl-org/SDL_mixer/archive/"${SDLMIXER_COMMIT}".tar.gz
			-> "${PN}"-sdlmixer-"${SDLMIXER_COMMIT}".tar.gz
		https://github.com/shadps4-emu/sirit/archive/"${SIRIT_COMMIT}".tar.gz
			-> "${PN}"-sirit-"${SIRIT_COMMIT}".tar.gz
		https://github.com/shadps4-emu/tracy/archive/"${TRACY_COMMIT}".tar.gz
			-> "${PN}"-tracy-"${TRACY_COMMIT}".tar.gz
		https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/"${VMA_COMMIT}".tar.gz
			-> "${PN}"-vma-"${VMA_COMMIT}".tar.gz
		https://github.com/KhronosGroup/Vulkan-Headers/archive/"${VULKANHEADERS_COMMIT}".tar.gz
			-> "${PN}"-vulkanheaders-"${VULKANHEADERS_COMMIT}".tar.gz
		https://github.com/herumi/xbyak/archive/"${XBYAK_COMMIT}".tar.gz
			-> "${PN}"-xbyak-"${XBYAK_COMMIT}".tar.gz
		https://github.com/zyantific/zydis/archive/"${ZYDIS_COMMIT}".tar.gz
			-> "${PN}"-zydis-"${ZYDIS_COMMIT}".tar.gz
		https://github.com/zyantific/zycore-c/archive/"${ZYCORE_COMMIT}".tar.gz
			-> "${PN}"-zycore-"${ZYCORE_COMMIT}".tar.gz
	"
fi

LICENSE="GPL-2+ MIT BSD Boost-1.0 OFL-1.1 CC0-1.0"
SLOT="0"
IUSE="+clang discord"

RDEPEND="
	"${DEPEND}"
"

DEPEND="
	>=media-video/ffmpeg-5.1.2
	media-libs/libpng
	>=dev-libs/libfmt-10.2.0
	dev-libs/pugixml
	dev-libs/xxhash
	sys-libs/zlib-ng

	discord? (
		dev-libs/rapidjson
	)
"

BDEPEND="
	clang? ( llvm-core/clang ) !clang? ( sys-devel/gcc )

	dev-libs/boost
	dev-libs/half
	dev-cpp/robin-map
	dev-cpp/toml11
"

src_prepare() {
	if [[ "${PV}" != 9999 ]]; then
		rmdir "${S}"/externals/CLI11 || die
		mv "${WORKDIR}"/CLI11-"${CLI11_COMMIT}" "${S}"/externals/CLI11 || die

		rmdir "${S}"/externals/LibAtrac9 || die
		mv "${WORKDIR}"/ext-LibAtrac9-"${LIBATRAC9_COMMIT}" "${S}"/externals/LibAtrac9 || die

		rmdir "${S}"/externals/aacdec/fdk-aac || die
		mv "${WORKDIR}"/fdk-aac-"${FDKAAC_COMMIT}" "${S}"/externals/aacdec/fdk-aac || die

		rmdir "${S}"/externals/dear_imgui || die
		mv "${WORKDIR}"/ext-imgui-"${DEARIMGUI_COMMIT}" "${S}"/externals/dear_imgui || die

		rmdir "${S}"/externals/discord-rpc || die
		mv "${WORKDIR}"/ext-discord-rpc-"${DISCORDRPC_COMMIT}" "${S}"/externals/discord-rpc || die

		rmdir "${S}"/externals/ext-libusb || die
		mv "${WORKDIR}"/ext-libusb-"${LIBUSB_COMMIT}" "${S}"/externals/ext-libusb || die

		rmdir "${S}"/externals/glslang || die
		mv "${WORKDIR}"/glslang-"${GLSLANG_COMMIT}" "${S}"/externals/glslang || die

		rmdir "${S}"/externals/hwinfo || die
		mv "${WORKDIR}"/ext-hwinfo-"${HWINFO_COMMIT}" "${S}"/externals/hwinfo || die

		rmdir "${S}"/externals/json || die
		mv "${WORKDIR}"/json-"${JSON_COMMIT}" "${S}"/externals/json || die

		rmdir "${S}"/externals/magic_enum || die
		mv "${WORKDIR}"/magic_enum-"${MAGICENUM_COMMIT}" "${S}"/externals/magic_enum || die

		rmdir "${S}"/externals/miniz || die
		mv "${WORKDIR}"/miniz-"${MINIZ_COMMIT}" "${S}"/externals/miniz || die

		rmdir "${S}"/externals/sdl3 || die
		mv "${WORKDIR}"/sdl3-"${SDL_COMMIT}" "${S}"/externals/sdl3 || die

		rmdir "${S}"/externals/sdl3_mixer || die
		mv "${WORKDIR}"/SDL_mixer-"${SDLMIXER_COMMIT}" "${S}"/externals/sdl3_mixer || die

		rmdir "${S}"/externals/sirit || die
		mv "${WORKDIR}"/sirit-"${SIRIT_COMMIT}" "${S}"/externals/sirit || die

		rmdir "${S}"/externals/tracy || die
		mv "${WORKDIR}"/tracy-"${TRACY_COMMIT}" "${S}"/externals/tracy || die

		rmdir "${S}"/externals/vma || die
		mv "${WORKDIR}"/VulkanMemoryAllocator-"${VMA_COMMIT}" "${S}"/externals/vma || die

		rmdir "${S}"/externals/vulkan-headers || die
		mv "${WORKDIR}"/Vulkan-Headers-"${VULKANHEADERS_COMMIT}" "${S}"/externals/vulkan-headers || die

		rmdir "${S}"/externals/xbyak || die
		mv "${WORKDIR}"/xbyak-"${XBYAK_COMMIT}" "${S}"/externals/xbyak || die

		rmdir "${S}"/externals/zydis || die
		mv "${WORKDIR}"/zydis-"${ZYDIS_COMMIT}" "${S}"/externals/zydis || die

		rmdir "${S}"/externals/zydis/dependencies/zycore || die
		mv "${WORKDIR}"/zycore-c-"${ZYCORE_COMMIT}" "${S}"/externals/zydis/dependencies/zycore || die
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_UPDATER=no
		-DENABLE_DISCORD_RPC=$(usex discord)
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=on
	)

	if use clang; then
		CC=clang
		CXX=clang++
	else
		CC=gcc
		CXX=g++

		ewarn " "
		ewarn "You are not compiling with clang even though shadps4 is tested with clang."
		ewarn " "
		ewarn "If you are experiencing any issues try compiling with clang first"
		ewarn "before filing a bug report upstream."
		ewarn " "
	fi

	cmake_src_configure
}

pkg_postinst() {
	optfeature "the Official Qt Launcher for shadps4" games-emulation/shadps4-qtlauncher
}
