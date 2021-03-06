# $NetBSD: Makefile,v 1.9 2021/01/11 07:35:34 adam Exp $

DISTNAME=	rsa-4.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=r/rsa/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/sybrenstuvel/python-rsa
COMMENT=	Pure-Python RSA implementation
LICENSE=	apache-2.0

DEPENDS+=	${PYPKGPREFIX}-asn1>=0.1.3:../../security/py-asn1
TEST_DEPENDS+=	${PYPKGPREFIX}-mock-[0-9]*:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-mypy-[0-9]*:../../lang/py-mypy

PYTHON_VERSIONS_INCOMPATIBLE=	27

USE_LANGUAGES=	# none

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
		${MV} pyrsa-decrypt pyrsa-decrypt-${PYVERSSUFFIX} && \
		${MV} pyrsa-encrypt pyrsa-encrypt-${PYVERSSUFFIX} && \
		${MV} pyrsa-keygen pyrsa-keygen-${PYVERSSUFFIX} && \
		${MV} pyrsa-priv2pub pyrsa-priv2pub-${PYVERSSUFFIX} && \
		${MV} pyrsa-sign pyrsa-sign-${PYVERSSUFFIX} && \
		${MV} pyrsa-verify pyrsa-verify-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
