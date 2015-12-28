@echo off
REM this is required when you use TDM-GCC or any other mingw
@echo on

bakefile -f gnu -o Makefile  making_auto_tags_gen_linux.bkl
make -f Makefile
cmd

