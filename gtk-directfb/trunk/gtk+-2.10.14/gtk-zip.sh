#!/bin/sh

# Build zipfiles for GTK on Win32

ZIP=/tmp/gtk+-2.10.14.zip
DEVZIP=/tmp/gtk+-dev-2.10.14.zip
cd /opt/mipsel-linux-uclibc/usr

mkdir -p share/doc/gtk+-2.10.14
cp -p /media/Data/dingoo/dingux/dev/openwrt/trunk/build_dir/target-_-/gtk+-2.10.14/COPYING share/doc/gtk+-2.10.14

mkdir -p share/doc/gtk+-dev-2.10.14
cp -p /media/Data/dingoo/dingux/dev/openwrt/trunk/build_dir/target-_-/gtk+-2.10.14/COPYING share/doc/gtk+-dev-2.10.14

rm $ZIP
zip $ZIP -@ <<EOF
COPYING.LIB-2
etc/gtk-2.0/gdk-pixbuf.loaders
etc/gtk-2.0/gtkrc
etc/gtk-2.0/gtk.immodules
bin/libgdk_pixbuf-2.0-0.dll
bin/libgdk-win32-2.0-0.dll
bin/libgtk-win32-2.0-0.dll
EOF

zip $ZIP lib/gtk-2.0/2.10.0/loaders/*.dll lib/gtk-2.0/2.10.0/immodules/*.dll lib/gtk-2.0/2.10.0/engines/*.dll

zip $ZIP share/themes/Raleigh/gtk-2.0/gtkrc
zip $ZIP share/themes/Default/gtk-2.0-key/gtkrc
zip $ZIP share/themes/Emacs/gtk-2.0-key/gtkrc
zip $ZIP share/themes/MS-Windows/gtk-2.0/gtkrc

zip $ZIP lib/locale/*/LC_MESSAGES/gtk20.mo
zip $ZIP lib/locale/*/LC_MESSAGES/gtk20-properties.mo

zip -r $ZIP share/doc/gtk+-2.10.14

rm $DEVZIP
zip -r $DEVZIP -@ <<EOF
include/gtk-2.0
bin/gdk-pixbuf-csource.exe
bin/gdk-pixbuf-query-loaders.exe
bin/gtk-query-immodules-2.0.exe
bin/gtk-demo.exe
man/man1/gdk-pixbuf-csource.1
lib/libgdk_pixbuf-2.0.dll.a
lib/gdk_pixbuf-2.0.lib
lib/libgdk-win32-2.0.dll.a
lib/gdk-win32-2.0.lib
lib/libgtk-win32-2.0.dll.a
lib/gtk-win32-2.0.lib
lib/gtk-2.0/include
lib/pkgconfig/gdk-pixbuf-2.0.pc
lib/pkgconfig/gdk-2.0.pc
lib/pkgconfig/gdk-win32-2.0.pc
lib/pkgconfig/gtk+-2.0.pc
lib/pkgconfig/gtk+-win32-2.0.pc
share/aclocal/gtk-2.0.m4
share/gtk-2.0
share/gtk-doc/html/gdk-pixbuf
share/gtk-doc/html/gdk
share/gtk-doc/html/gtk
EOF

zip -r $DEVZIP share/doc/gtk+-dev-2.10.14
