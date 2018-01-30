# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=(python2_7)

inherit bash-completion-r1 python-single-r1 eutils autotools git-2

DESCRIPTION="A CD ripper aiming for accuracy over speed."
HOMEPAGE="http://thomas.apestaart.org/morituri/trac/"

EGIT_REPO_URI="https://github.com/thomasvs/morituri"
EGIT_HAS_SUBMODULES=1

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="alac +cdio doc +cddb +flac test wav wavpack"

RDEPEND="media-sound/cdparanoia
	media-plugins/gst-plugins-cdparanoia:0.10
	app-cdr/cdrdao
	media-libs/gstreamer:0.10
	media-libs/gst-plugins-base:0.10
	alac? ( media-plugins/gst-plugins-ffmpeg:0.10 )
	cdio? ( dev-python/pycdio )
	cddb? ( dev-python/cddb-py )
	flac? ( media-plugins/gst-plugins-flac:0.10 )
	wav? ( media-libs/gst-plugins-good:0.10 )
	wavpack? ( media-plugins/gst-plugins-wavpack:0.10 )
	doc? ( dev-python/epydoc )
	test? ( dev-python/pychecker )
	dev-python/gst-python:0.10
	dev-python/python-musicbrainz
	dev-python/python-musicbrainz-ngs
	dev-python/pygobject
	dev-python/pygtk
	dev-python/pyxdg"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	# disable doc building
	local ac_cv_prog_EPYDOC=""

	# disable test
	local ac_cv_prog_PYCHECKER=""

	default
}

src_install() {
	default

	python_doscript bin/rip

	rm -rf "${D}/etc" || die
	dobashcomp etc/bash_completion.d/rip

	dodoc AUTHORS HACKING NEWS README RELEASE TODO

	use doc && dohtml -r doc/reference/*
}
