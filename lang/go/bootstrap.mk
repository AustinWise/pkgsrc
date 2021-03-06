# $NetBSD: bootstrap.mk,v 1.5 2020/12/12 11:08:26 maya Exp $

.if !defined(GOROOT_BOOTSTRAP) || !exists(${GOROOT_BOOTSTRAP}/bin/go)
.  if ${MACHINE_ARCH} == "aarch64"
BUILD_DEPENDS+=		go-bin-[0-9]*:../../lang/go-bin
GOROOT_BOOTSTRAP=	${PREFIX}/go-bin
.  else
BUILD_DEPENDS+=		go14-1.4*:../../lang/go14
GOROOT_BOOTSTRAP=	${PREFIX}/go14
.  endif
.endif
