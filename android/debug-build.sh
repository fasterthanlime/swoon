#!/bin/bash
(cd .. && make android) && ndk-build NDK_DEBUG=1 -j7 && ant debug install
