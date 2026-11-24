#!/bin/sh
# Copyright (c) 2013-2023 Collapsedev

make clean
make distclean

export CFLAGS="-march=native -mtune=native -O3 -std=c++14"
export CXXFLAGS="-march=native -mtune=native -O3 -std=c++14"
export DEBUG_CXXFLAGS=""

##
## Custom OpenSSL
##
export SSL_CFLAGS=$SSL_CFLAGS"-I /usr/local/openssl-1.0.2u/include"
export CRYPTO_CFLAGS=$CRYPTO_CFLAGS"-I /usr/local/openssl-1.0.2u/include"
export SSL_LIBS=$SSL_LIBS"/usr/local/openssl-1.0.2u/lib/libssl.so.1.0.0"
export CRYPTO_LIBS=$CRYPTO_LIBS"/usr/local/openssl-1.0.2u/lib/libcrypto.so.1.0.0"

./autogen.sh

##
## Custom OpenSSL
##
export LDFLAGS="-L/usr/local/openssl-1.0.2u/lib"
export CPPFLAGS="-I/usr/local/openssl-1.0.2u/include"

./configure  --without-gui --with-incompatible-bdb --without-miniupnpc --disable-tests --disable-ipv6

echo ""
echo ""
echo ""
echo "Type make command"
echo "Remove debug symbols: strip src/stronghandsd ; strip src/stronghands-cli"

#make
