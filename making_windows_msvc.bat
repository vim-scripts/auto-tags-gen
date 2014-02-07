@echo off
REM this is required when you use visual studio 2008
@echo on

bakefile -f msvc -o Makefile.msvc.mak   making_auto_tags_gen_windows.bkl
call C:\PROGRA~1\MICROS~1.0\VC\vcvarsall.bat
nmake 1>out.txt -f Makefile.msvc.mak
cmd

