// Last Change: 2013-06-24 11:56:40
/**< Vim plugin to create tags file silently, for the opened file's directory.
 *< Can add directory recursively. This is a shared lib plugin.
 *< Use it along with the vimscript provided.
 *< I have not tested this plugin on Linux,
 *< but you can test it on Linux.
 */
#include <errno.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* On Windows OS, MinGW and Tiny C are supported */
#if  ((defined( __WIN32__ ) || defined(__WIN64__) || defined( __WINDOWS__ )) \
     && !(defined( __MINGW32__ ) || defined( __MINGW64__ ) || defined( __TINYC__ )))
#error  "Compiler not supported, On MS-Windows, only compilers MinGW or Tiny C are supported"
#elif ((defined( __linux__ ) || defined( __LINUX__ )) \
     && !(defined( __GNUC__ ) || defined( __GNUC_VERSION__ ) || defined( __TINYC__ )))
#error  "Compiler not supported, On Linux, only compilers GCC or Tiny C are supported"
#endif

#define  N  4 /* number of Commands */

/* On Windows, this minimizes the process on taskbar.
 * Linux not tested, but the Commands are also given for Linux.
 * No Linux, try modifiying it, if it does not work. */
#if defined(__WIN32__) || defined(__WIN64__) || defined(__WINDOWS__)
#define OS_DEP char cmd_minimize[220]="start /min cmd /c ctags ";
#elif defined(__LINUX__)
#define OS_DEP char cmd_minimize[220]="ctags & ";
#endif

void auto_tag_gen_ctags(int job);
void tag_creator_engine(int job);

void auto_tag_gen_ctags(int job) {
  if((job>0)&&(job<=N)) {
    tag_creator_engine(job);
  }
}

void tag_creator_engine(int job) {
  OS_DEP
  char ctags_cmd[N][200]= { /* not more than 200 characters */
    "-R --c-kinds=+pxfvtcdeglmnsu --c++-kinds=+pxfvtcdeglmnsu --languages=C,C++ --langmap=C:.c.h --langmap=C++:.C.H.h.c.cpp.hpp.c++.cc.cp.cxx.h++.hh.hp.hxx --fields=+iaSm --extra=+qf -f tags *",
    "--c-kinds=+pxfvtcdeglmnsu --c++-kinds=+pxfvtcdeglmnsu --languages=C,C++ --langmap=C:.c.h --langmap=C++:.C.H.h.c.cpp.hpp.c++.cc.cp.cxx.h++.hh.hp.hxx --fields=+iaSm --extra=+qf -f tags *",
    "--c-kinds=+pxfvtcdeglmnsu --c++-kinds=+pxfvtcdeglmnsu --languages=C,C++ --langmap=C:.c.h --langmap=C++:.C.H.h.c.cpp.hpp.c++.cc.cp.cxx.h++.hh.hp.hxx. --fields=+iaSm --extra=+qf -f tags *",
    "-R --c-kinds=+pxfvtcdeglmnsu --c++-kinds=+pxfvtcdeglmnsu --languages=C,C++ --langmap=C:.c.h --langmap=C++:.C.H.h.c.cpp.hpp.c++.cc.cp.cxx.h++.hh.hp.hxx. --fields=+iaSm --extra=+qf -f tags *",
  };
  job=job-1;
  strcat(cmd_minimize,*(ctags_cmd+job));
  system(cmd_minimize);/*old was:- system(*(ctags_cmd+job));*/
  /* decreasing, since array starts with 0.
            Reducing choice since the user will input one more */
}


/* Version 0.0.02-win32 */
/* NOTE: Don't use __stdcall or __fastcall or any other calling convention.
 * Use only __cdecl calling convention.
 * Don't use Dll APIENTRY point, like
 * DLL_EXPORT or anything.
 * Vim does not permit these for its plugins.
 * Use C calling convention only. */


