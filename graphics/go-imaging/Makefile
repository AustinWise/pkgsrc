# $NetBSD: Makefile,v 1.23 2021/01/23 14:23:05 bsiegert Exp $

DISTNAME=	imaging-1.5.0
PKGNAME=	go-${DISTNAME}
PKGREVISION=	22
MASTER_SITES=	${MASTER_SITE_GITHUB:=disintegration/}
CATEGORIES=	graphics
GITHUB_PROJECT=	imaging
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/disintegration/imaging
COMMENT=	Simple image processing package for Go
LICENSE=	mit

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/disintegration/imaging

.include "../../graphics/go-image/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
