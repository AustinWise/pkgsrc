# $NetBSD: options.mk,v 1.9 2021/01/04 10:12:42 jperkin Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.rust
PKG_SUPPORTED_OPTIONS+=	rust-cargo-static

.include "../../mk/bsd.fast.prefs.mk"

# The bundled LLVM current has issues building on SunOS.
.if ${OPSYS} != "SunOS" && ${OPSYS} != "Darwin"
PKG_SUPPORTED_OPTIONS+=		rust-llvm
# There may be compatibility issues with base LLVM.
.  if !empty(HAVE_LLVM)
PKG_SUGGESTED_OPTIONS+=		rust-llvm
.  endif
.endif

.if ${OPSYS} == "NetBSD"
PKG_SUGGESTED_OPTIONS+=	rust-cargo-static
.endif

.include "../../mk/bsd.options.mk"

#
# Use the internal copy of LLVM.
# This contains some extra optimizations.
#
.if !empty(PKG_OPTIONS:Mrust-llvm)
BUILD_DEPENDS+=	cmake-[0-9]*:../../devel/cmake
.include "../../devel/cmake/buildlink3.mk"
.else
.include "../../lang/llvm/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-llvm-link-shared
CONFIGURE_ARGS+=	--llvm-root=${BUILDLINK_PREFIX.llvm}
# XXX: fix for Rust 1.41.0 https://github.com/rust-lang/rust/issues/68714
MAKE_ENV+=	LIBRARY_PATH=${BUILDLINK_PREFIX.llvm}/lib
.endif

#
# Link cargo statically against "native" libraries.
# (openssl and curl specifically).
#
.if !empty(PKG_OPTIONS:Mrust-cargo-static)
CONFIGURE_ARGS+=	--enable-cargo-native-static
.else
BUILDLINK_API_DEPENDS.nghttp2+= nghttp2>=1.41.0
BUILDLINK_API_DEPENDS.curl+= 	curl>=7.67.0
.include "../../www/curl/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif
