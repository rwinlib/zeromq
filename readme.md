Both libzmq and the driver must be compiled with

    CXXFLAGS=-DZMQ_STATIC

and to link with:

    -lzmq -lsodium -liphlpapi -lws2_32

The lib-4.9.3 builds were compiled with Rtools 3.3 and
lib-4.6.3 with gcc 4.8.5 from mingw-builds because
4.6.3 is missing some C++11 features.
