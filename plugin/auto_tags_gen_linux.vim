" Last Change: 2015-07-29  Wednesday: 01:05:02 PM
" Version 0.0.05-linux
" Vim plugin file
" Maintainer: Pinaki Sekhar Gupta
" <appugupta007@yahoo.co.in>,<appugupta007@gmail.com>
" (Don't mail me unless it becomes necessary, discuss everything
" at the Vim-Wiki, click at the top of the plugin's page)
"
"
" auto_tags_gen.vim
" automatically generates tags with ctags
"
" to install, put the script and maximize.dll
" in ~/.vim/plugin

" Execute only once {{{
if exists("g:loaded_auto_tag_generator")
	finish
endif
let g:loaded_auto_tag_generator=1
" }}}

"  variable 'atgr' stands for auto_tags_gen_trigger
if !exists("s:atgr")
  let s:atgr = 0
endif
"  variable 'atgrFr' stands for auto_tags_gen_trigger with Force-Now option
if !exists("s:atgrFr")
  let s:atgrFr = 0
endif

fun! ATGOption0()
 let s:atgr = 0
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.0:-\ \ de-activate :call ATGOption0()<cr>

fun! ATGOption1()
 let s:atgr = 1
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.1:-\ \ recursive\ (-R)\.\ For\ working\ directory :call ATGOption1()<cr>

fun! ATGOption2()
 let s:atgr = 2
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.2:-\ \ non-recursive\.\ For\ working\ directory :call ATGOption2()<cr>

fun! ATGOption3()
 let s:atgr = 3
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.3:-\ \ for\ <\include\>\ directory :call ATGOption3()<cr>

fun! ATGOption4()
 let s:atgr = 4
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.4:-\ \ for\ <\include\>\ directory\ (\recursively\) :call ATGOption4()<cr>

" ===================================================================================================================
"  ======================================================
"  Separator
"  ======================================================
:menu Plugin.auto\ tags\ gen\ C/C++.-Sep0-	:


function! Force_creations_ctags()
  let curr_dir = expand('%:h')
  if curr_dir == ''
    let curr_dir = '.'
  endif
  execute 'lcd ' . curr_dir
  call libcallnr(s:atgdllfile, 'auto_tag_gen_ctags', s:atgrFr)
  execute 'lcd -'
endfunction
" -----------------------------------------
" atgdllfile :- see below. it expands to the name of the .dll/.so .
" auto_tag_gen_ctags :- its the function in the .dll/.so that does the tags manufacturing job.
" atgrFr/atgr is a number that we pass to the function to get the desired task accomplished.


fun! ATGOption1_force()
 let s:atgrFr = 1
 call Force_creations_ctags()
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.Force\ Now\ with\ Option\ 1 :call ATGOption1_force()<cr>

fun! ATGOption2_force()
 let s:atgrFr = 2
 call Force_creations_ctags()
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.Force\ Now\ with\ Option\ 2 :call ATGOption2_force()<cr>

fun! ATGOption3_force()
 let s:atgrFr = 3
 call Force_creations_ctags()
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.Force\ Now\ with\ Option\ 3 :call ATGOption3_force()<cr>

fun! ATGOption4_force()
 let s:atgrFr = 4
 call Force_creations_ctags()
endfun
:amenu Plugin.auto\ tags\ gen\ C/C++.Force\ Now\ with\ Option\ 4 :call ATGOption4_force()<cr>

" ===================================================================================================================




function! Tags_creations_ctags()
  let curr_dir = expand('%:h')
  if curr_dir == ''
    let curr_dir = '.'
  endif
  execute 'lcd ' . curr_dir
  call libcallnr(s:atgdllfile, 'auto_tag_gen_ctags', s:atgr)
  execute 'lcd -'
endfunction


" Set the default compatibility options {{{
" (don't know if they do any difference, in such a small script...)
let s:save_cpoptions=&cpoptions
set cpoptions&vim
" }}}

let s:atgdllfile=expand('<sfile>:p:h').'/libauto_tag_gen.so'
au BufWrite * call Tags_creations_ctags()

" vim:fdm=marker:fmr={{{,}}}

" Restore the saved compatibility options {{{
let &cpoptions=s:save_cpoptions
" }}}

