# Copyright 2012-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2:2.5 3:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Code checking using pep8 and pyflakes"
HOMEPAGE="http://pypi.python.org/pypi/flake8
https://bitbucket.org/tarek/flake8"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# setuptools required RDEPEND for extensions
DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
>=dev-python/mccabe-0.2
>=dev-python/pep8-1.4.3
>=dev-python/pyflakes-0.6.1-r1"

DOCS="README.rst CHANGES.rst CONTRIBUTORS.txt LICENSE"