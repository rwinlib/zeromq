export CC="/mingw32/bin/gcc.exe"
export CXX="/mingw32/bin/g++.exe"
export CPPFLAGS="-I/usr/local/include -DZMQ_STATIC"
export LDFLAGS="-L/usr/local/lib"
 ../zeromq-4.2.1/configure \
 --enable-static \
 --with-libsodium
