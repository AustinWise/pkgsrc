$NetBSD: patch-src_svg_svg-length.cpp,v 1.3 2021/01/13 11:43:34 jperkin Exp $

Use correct pow().

--- src/svg/svg-length.cpp.orig	2020-09-07 08:57:41.000000000 +0000
+++ src/svg/svg-length.cpp
@@ -22,6 +22,8 @@
 #include "stringstream.h"
 #include "util/units.h"
 
+using std::pow;
+
 static unsigned sp_svg_length_read_lff(gchar const *str, SVGLength::Unit *unit, float *val, float *computed, char **next);
 
 #ifndef MAX
