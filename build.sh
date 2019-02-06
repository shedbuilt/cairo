#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_CAIRO_OPTIONS=''
# Configure
if [ -n "${SHED_PKG_LOCAL_OPTIONS[gles]}" ]; then
    SHED_PKG_LOCAL_CAIRO_OPTIONS='--enable-glesv2 --enable-egl'
fi
./configure --prefix=/usr \
            --disable-static \
	    --enable-tee \
	    $SHED_PKG_LOCAL_CAIRO_OPTIONS &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install
