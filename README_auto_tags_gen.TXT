Plugin for creating tags with ctags
in the current working directory of the currently opened
buffer (file), automatically, when you save your file.

This plugin works with C/C++ files only.

Works in the current working directory. It can include
sub-directories as well. You can generate tags files automatically
for easy access through Omni completions,
and facilitate the plug-in that depends on a tags file.

You can even create tags file in any directory without
saving a file.

For example: code_complete.vim (by Mingbai),
             echofunc.vim (by Mingbai), plugins rely on a
             tags file in the working directory
             and the include directories added to vim's search list.

All of this is specified within a simple text file based plugin script
(auto_tags_gen.vim) with a few global variables and
a shared library (auto_tag_gen.dll and libauto_tag_gen.so on linux).

Written For Vim version 7.4. May work with older
versions as well as the future releases also.

    Tested with Vim 32-bit on Windows XP/7 32-bit, Windows 7 64-bit (vim 32-bit),
    may work with Vim 64-bit on Windows 64-bit.
    Now it works on Linux. Tested in ubuntu 13.04 (Gvim from its repository).



You must set 'nocompatible' in your _vimrc file to use this plugin. You can
stop the plugin from being loaded by setting the
"loaded_auto_tag_generator" variable:

	:let loaded_auto_tag_generator = 0

in your vimrc file.
You can also put these lines for your convenience:

filetype on
filetype plugin on
set number
set laststatus=2
:set timeout timeoutlen=4500 "   ttimeoutlen=100 "  default settings -1 not harmed under comment
set history=100 " tons of command-line history. Can be used with up-dn arrow key


Installation:
Download Exuberant ctags from
 http://ctags.sourceforge.net.
Put ctags.exe into C:\WINDOWS\system32 (for Windows XP only)
or, create a folder for ctags and finally add this folder to path, by
r-clicking at My Computer -> Properties -> Advanced -> Environment Variables
-> System Variables -> Path. (XP)
or,
r-clicking at Computer -> Advanced System Settings -> System Properties
-> Advanced tab -> Environment Variables
-> System Variables -> Path. (Win7)

But I recommend to put this stuff into system32 instead of cluttering up
the System Path, if you are using XP, otherwise follow the second method (for Win7).

Ubuntu users should download ctags from the software centre or via synaptic package manager.

Using 7-zip extract "auto_tag_gen_v0.00.04win32.7z" to any location
of your preference. This contains source code for the shared library and the
makefiles for different targets and compilers, plus "auto_tag_gen.zip".

At this time it supports 3 compilers on Windows:- mingw, tiny C, Visual Studio.
This project relies on bakefile (http://www.bakefile.org). The project also includes
bakefile scripts. If you want to create your own makefile then you can also
use it but its not required to build the project,
since it already includes the makefiles required to build.
The makefiles have been created using bakefile.

Extract "auto_tag_gen.zip" and put the stuffs in their respective
locations, e.g. 'auto_tags_gen.txt' to C:\Program Files\vim\vim73\doc
'auto_tag_gen.dll' and 'auto_tags_gen.vim' to
C:\Program Files\vim\vim73\plugin

or,

In ubuntu linux,
extract and enter the directory from gnome-terminal where the Makefile is contained,
type
sudo make install
Now copy the 'auto_tags_gen_linux.vim' into ~/.vim/plugin

Fire-up gVim and at the Vim command-line do (windows):
:helptags $VIMRUNTIME/doc
then,
:h auto_tags_gen

or, in ubuntu linux,
:helptags $HOME/.vim/doc

Read the documentations carefully.

CAUTION:: On Windows, this plugin kills all the running 'cmd.exe' at the background
to prevent running several ctags process targeting the same 'tags'.
This has some obvious advantages but a precaution is necessary.
Means if you are doing very important tasks via 'cmd.exe' such as compiling etc.,
then do not use this plugin, as it would interrupt your task by killing it midway.
This plugin does not work with console version of vim,
and you should not try to integrate the plugin with the console version of vim
as it would kill the vim itself by killing the 'cmd.exe'.
Only use GVim.

On linux you don't have to worry about it.







