#!/bin/sh

# Build zipfiles for ATK on Win32

ZIP=/tmp/atk-1.22.0.zip
DEVZIP=/tmp/atk-dev-1.22.0.zip

cd /opt/mipsel-linux-uclibc/usr
rm $ZIP

DLLDIR=lib
[ -f bin/libatk-1.0-0.dll ] && DLLDIR=bin

zip $ZIP -@ <<EOF
$DLLDIR/libatk-1.0-0.dll
EOF

zip $ZIP lib/locale/*/LC_MESSAGES/atk10.mo

rm $DEVZIP
zip -r $DEVZIP -@ <<EOF
include/atk-1.0
lib/libatk-1.0.dll.a
lib/atk-1.0.lib
lib/atk-1.0.def
lib/pkgconfig/atk.pc
EOF
