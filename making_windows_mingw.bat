@echo off
REM this is required when you use TDM-GCC or any other mingw
@echo on

bakefile -f mingw -o Makefile.mingw.mak   making_auto_tags_gen_windows.bkl
mingw32-make -f Makefile.mingw.mak
cmd

