# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_DEPEND="3"
PYTHON_COMPAT=( python3_4 )

inherit python-utils-r1 python-single-r1 git-r3

DESCRIPTION="HolyWu's ported AviSynth scripts for VapourSynth"
HOMEPAGE="http://forum.doom9.org/showthread.php?t=166582"
SRC_URI="https://dl.dropboxusercontent.com/u/36232595/havsfunc-r${PV}.7z"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND+="
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}
"

S="${WORKDIR}"

src_install(){
	insinto "$(python_get_sitedir)"
	doins havsfunc.py
}
