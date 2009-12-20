/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.in by autoheader.  */
/* acconfig.h
   This file is in the public domain.

   Descriptive text for the C preprocessor macros that
   the distributed Autoconf macros can define.
   No software package will use all of them; autoheader copies the ones
   your configure.in uses into your configuration header file templates.

   The entries are in sort -df order: alphabetical, case insensitive,
   ignoring punctuation (such as underscores).  Although this order
   can split up related entries, it makes it easier to check whether
   a given entry is in the file.

   Leave the following blank line there!!  Autoheader needs it.  */


/* Other stuff */
#define ENABLE_NLS 1
#define GTK_COMPILED_WITH_DEBUGGING "minimum"

/* #undef HAVE_CATGETS */
/* #undef HAVE_DIMM_H */
#define HAVE_GETTEXT 1
/* #undef HAVE_IPC_H */
#define HAVE_LC_MESSAGES 1
#define HAVE_PROGRESSIVE_JPEG 1
#define HAVE_PWD_H 1
/* #undef HAVE_SHM_H */
/* #undef HAVE_STPCPY */
/* #undef HAVE_XSHM_H */
/* #undef HAVE_SHAPE_EXT */
/* #undef HAVE_SOLARIS_XINERAMA */
/* #undef HAVE_SYS_SELECT_H */
#define HAVE_SYS_TIME_H 1
/* #undef HAVE_XFREE_XINERAMA */
/* #undef HAVE_XINERAMA */
/* #undef HAVE_WINTAB */
/* #undef HAVE_XCONVERTCASE */
/* #undef HAVE_XFT */

#define HAVE_SIGSETJMP 1

/* #undef NO_FD_SET */

/* #undef RESOURCE_BASE */

#define USE_GMODULE 1
/* #undef USE_MMX */

/* Define to use XKB extension */
/* #undef HAVE_XKB */

/* Define to use shadowfb in the linux-fb port */
/* #undef ENABLE_SHADOW_FB */

/* Define to use a fb manager in the linux-fb port */
/* #undef ENABLE_FB_MANAGER */

/* #undef XINPUT_NONE */
/* #undef XINPUT_GXI */
/* #undef XINPUT_XFREE */

/* Define as the return type of signal handlers (int or void).  */
#define RETSIGTYPE void

/* Most machines will be happy with int or void.  IRIX requires '...' */
/* #undef SIGNAL_ARG_TYPE */

#define GETTEXT_PACKAGE "gtk20"

/* #undef HAVE_CUPS_API_1_2 */

/* #undef PACKAGE */
/* #undef VERSION */


/* Leave that blank line there!!  Autoheader needs it.
   If you're adding to this file, keep in mind:
   The entries are in sort -df order: alphabetical, case insensitive,
   ignoring punctuation (such as underscores).  */

/* always defined to indicate that i18n is enabled */
#define ENABLE_NLS 1

/* Define the location where the catalogs will be installed */
#define GTK_LOCALEDIR "/opt/mipsel-linux-uclibc/usr/share/locale"

/* Define to 1 if you have the `bind_textdomain_codeset' function. */
#define HAVE_BIND_TEXTDOMAIN_CODESET 1

/* Is the wctype implementation broken */
#define HAVE_BROKEN_WCTYPE 1

/* Define to 1 if you have the <crt_externs.h> header file. */
/* #undef HAVE_CRT_EXTERNS_H */

/* Define to 1 if you have the `dcgettext' function. */
#define HAVE_DCGETTEXT 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the `flockfile' function. */
#define HAVE_FLOCKFILE 1

/* Define to 1 if you have the `getc_unlocked' function. */
#define HAVE_GETC_UNLOCKED 1

/* Define to 1 if you have the `getpagesize' function. */
#define HAVE_GETPAGESIZE 1

/* Define to 1 if you have the `getresuid' function. */
#define HAVE_GETRESUID 1

/* Define if the GNU gettext() function is already present or preinstalled. */
#define HAVE_GETTEXT 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if your <locale.h> file defines LC_MESSAGES. */
#define HAVE_LC_MESSAGES 1

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1 if you have the `lstat' function. */
#define HAVE_LSTAT 1

/* Define to 1 if you have the `mallinfo' function. */
#define HAVE_MALLINFO 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mkstemp' function. */
#define HAVE_MKSTEMP 1

/* Define to 1 if you have a working `mmap' system call. */
/* #undef HAVE_MMAP */

/* Define to 1 if you have the <pwd.h> header file. */
#define HAVE_PWD_H 1

/* Have the Xrandr extension library */
/* #undef HAVE_RANDR */

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#define HAVE_SYS_WAIT_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Have uxtheme.h include file */
/* #undef HAVE_UXTHEME_H */

/* Have wchar.h include file */
/* #undef HAVE_WCHAR_H */

/* Have wctype.h include file */
/* #undef HAVE_WCTYPE_H */

/* Define if we have X11R6 */
/* #undef HAVE_X11R6 */

/* Define to 1 if you have the `XConvertCase' function. */
/* #undef HAVE_XCONVERTCASE */

/* Have the Xcursor library */
/* #undef HAVE_XCURSOR */

/* Have the XFIXES X extension */
/* #undef HAVE_XFIXES */

/* Define to 1 if you have the `XInternAtoms' function. */
/* #undef HAVE_XINTERNATOMS */

/* Have the SYNC extension library */
/* #undef HAVE_XSYNC */

/* Define if _NL_MEASUREMENT_MEASUREMENT is available */
/* #undef HAVE__NL_MEASUREMENT_MEASUREMENT */

/* Define if _NL_PAPER_HEIGHT is available */
/* #undef HAVE__NL_PAPER_HEIGHT */

/* Define if _NL_PAPER_WIDTH is available */
/* #undef HAVE__NL_PAPER_WIDTH */

/* Define if _NL_TIME_FIRST_WEEKDAY is available */
/* #undef HAVE__NL_TIME_FIRST_WEEKDAY */

/* Define to 1 if you have the `_NSGetEnviron' function. */
/* #undef HAVE__NSGETENVIRON */

/* Define if <X11/extensions/XIproto.h> needed for xReply */
/* #undef NEED_XIPROTO_H_FOR_XREPLY */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "http://bugzilla.gnome.org/enter_bug.cgi?product=gtk%2B"

/* Define to the full name of this package. */
#define PACKAGE_NAME "gtk+"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "gtk+ 2.10.14"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "gtk+"

/* Define to the version of this package. */
#define PACKAGE_VERSION "2.10.14"

/* Define as the return type of signal handlers (`int' or `void'). */
#define RETSIGTYPE void

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Whether to load modules via .la files rather than directly */
/* #undef USE_LA_MODULES */

/* Define to 1 if the X Window System is missing or not being used. */
/* #undef X_DISPLAY_MISSING */

/* Number of bits in a file offset, on hosts where this is settable. */
#define _FILE_OFFSET_BITS 64

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `int' if <sys/types.h> doesn't define. */
/* #undef gid_t */

/* Define to `int' if <sys/types.h> doesn't define. */
/* #undef uid_t */
#define __u32 u32
#define __u8 u8
