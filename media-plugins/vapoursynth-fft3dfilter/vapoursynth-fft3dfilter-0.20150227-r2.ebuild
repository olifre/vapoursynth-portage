# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 toolchain-funcs

DESCRIPTION="VapourSynth port of FFT3DFilter"
HOMEPAGE="https://github.com/VFR-maniac/VapourSynth-FFT3DFilter"

EGIT_REPO_URI="https://github.com/VFR-maniac/${PN}.git"
EGIT_COMMIT="b023e21954423f29fdefcb54a6b0540deb3bdac4"

KEYWORDS="-*"
LICENSE="GPL-2"
IUSE=""
SLOT="0"

RDEPEND+="
	media-libs/vapoursynth
	sci-libs/fftw:3.0[threads]
"
DEPEND="${RDEPEND}
"

PATCHES=("${FILESDIR}/${P}-cmath.patch")

src_prepare() {
	sed -i -e "s:CXX=\"g++\":CXX=\"$(tc-getCC)\":" configure || die
	sed -i -e "s:LD=\"g++\":LD=\"$(tc-getCC)\":" configure || die
	sed -i -e 's/CXXFLAGS="-O3 -ffast-math -fomit-frame-pointer -fno-tree-vectorize $CXXFLAGS"/CXXFLAGS="-ffast-math -fno-tree-vectorize $CXXFLAGS"; STRIP=""/g' configure || die

	eapply ${PATCHES}
	eapply_user
}

src_configure() {
	./configure --prefix="${ROOT}usr" \
				--libdir="${ROOT}usr/$(get_libdir)" \
				--extra-cxxflags="${CXXFLAGS}" \
				--extra-ldflags="${LDFLAGS}" || die
}
