Both libzmq and the driver must be compiled with

    CXXFLAGS=-DZMQ_STATIC

and to link with:

    -lzmq -lsodium -liphlpapi -lws2_32

The lib-4.9.3 builds were compiled with Rtools 3.3.
The lib-4.6.3/x64 was built with gcc 4.8.5 from mingw-builds.
The lib-4.6.3/i386 was built with Rtools 4.6.3 plus hacks below.


## Hacks for old toolchain:

ZeroMQ did not compile out of the box with gcc 4.6.3. However
the 4.8.5 build was giving segfaults for win32. In order to patch
ZeroMQ for gcc 4.6.3 I updated `windows.hpp` to have:

```c
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0600
#endif

#include <winsock2.h>
#include <windows.h>
#include <mswsock.h>

#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0500
#include <iphlpapi.h>
#include <Netioapi.h>
#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0600

#if !defined __MINGW32__
#include <mstcpip.h>
#endif
```

And then at the top of `tcp_address.cpp` I added:

```c
#define ZMQ_HAVE_WINDOWS_TARGET_XP
```