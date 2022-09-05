#!/bin/bash
cd ..
mv wt/ wt-src/
#remove previous installation
rm -r wt-build
rm -r wt
mkdir wt-build
mkdir wt
cd wt-build
cmake \
-DCMAKE_CXX_STANDARD=20 \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=../wt \
-DSHARED_LIBS=On \
-DBUILD_EXAMPLES=Off \
-DINSTALL_DOCUMENTATION=Off \
-DINSTALL_EXAMPLES=Off \
-DINSTALL_RESOURCES=On \
-DENABLE_SSL=On \
-DENABLE_HARU=On \
-DENABLE_PANGO=Off \
-DENABLE_EXT=Off \
-DENABLE_SQLITE=On \
-DENABLE_POSTGRES=Off \
-DENABLE_FIREBIRD=Off \
-DENABLE_MYSQL=Off \
-DENABLE_MSSQLSERVER=Off \
-DENABLE_QT4=Off \
-DENABLE_QT5=Off \
-DENABLE_QT6=Off \
-DENABLE_SAML=Off \
-DENABLE_LIBWTTEST=Off \
-DENABLE_LIBWTDBO=On \
-DWT_NO_STD_LOCALE=Off \
-DWT_NO_STD_WSTRING=Off \
-DENABLE_OPENGL=On \
-DENABLE_UNWIND=Off \
-DCONNECTOR_ISAPI=Off \
-DCONNECTOR_FCGI=Off \
-DCONNECTOR_HTTP=On \
-DBOOST_DYNAMIC=Off \
-DHARU_DYNAMIC=On \
-DHARU_LIB=../libharu/lib/libharu.so \
-DHARU_INCLUDE_DIR=../libharu/include \
-DHARU_PREFIX=../libharu \
-DPNG_LIBRARY_RELEASE=../libpng/lib/libpng.so \
-DPNG_PNG_INCLUDE_DIR=../libpng/include \
-DZLIB_LIBRARY_RELEASE=../zlib/lib/libz.so \
-DZLIB_INCLUDE_DIR=../zlib/include \
-DZLIB_PREFIX=../zlib \
-DHTTP_WITH_ZLIB=On \
-DSHARED_LIBS=On \
-DMULTI_THREADED=On \
-DWT_CPP17_ANY_IMPLEMENTATION=std \
../wt-src
make -j 8
make install
cd ..
rm -r wt-build
cp wt-src/bk.cmake wt

