# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy{1_9,2_0} )

inherit distutils-r1

DESCRIPTION="Rapid multi-Python deployment"
HOMEPAGE="http://codespeak.net/execnet/ https://pypi.python.org/pypi/execnet/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"
RDEPEND=""

python_compile_all() {
	use doc && emake -C doc html
}

src_test() {
	# Tests are a bit fragile to failures in parallel.
	# XXX: take a closer look, it may be easy to fix.
	local DISTUTILS_NO_PARALLEL_BUILD=1

	distutils-r1_python_test
}

python_test() {
	# Re-enable in order to properly test disabling it ;).
	# https://bitbucket.org/hpk42/execnet/issue/10
	unset PYTHONDONTWRITEBYTECODE

	py.test || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/_build/html/. )

	distutils-r1_python_install_all
}
