"===================================================================
"   Vim Setting 
"===================================================================
" $Id: .vimrc 35 2008-08-16 17:07:39Z ao $

scriptencoding euc-jp

" Á´ÈÌ --------------------------------------------------------------
set nocompatible
syntax enable
filetype plugin on
filetype indent on 
set shell=/bin/bash


let $BASH_ENV="~/.bashrc" 
cd ~ | let g:home = getcwd() | cd -
let mapleader='\'

set helplang=ja
set runtimepath+=~/vimdoc/build/runtime

" for Kaoriya ÈÇ
let g:no_vimrc_example = 1
let plugin_dicwin_disable = 1

" ¥«¡¼¥½¥ë°ÜÆ° ----------------------------------------------------- 
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> <C-j> 3j
noremap <silent> <C-k> 3k
nnoremap <silent> w :call ForwardWord()<CR>
nnoremap <silent> b :call BackwardWord()<CR>
nnoremap <Space>n :cn<CR>
nnoremap <Space>m :cp<CR>
nnoremap <silent> } :call ForwardParagraph()<CR>
onoremap <silent> } :call ForwardParagraph()<CR>
vnoremap <silent> } <Esc>:<C-u>call ForwardParagraph()<CR>mzgv`z
vnoremap <Esc> <Esc>`<
vnoremap <silent> y y`>
noremap <silent> ) /)\\|;\\|\\./e<CR>:call RemoveLastSearchHistory()<CR>
noremap <silent> ( /)\\|;\\|\\./e<CR>:call RemoveLastSearchHistory()<CR>
" formatoptions ¤Ë M,B¤¬Æþ¤Ã¤Æ¤¤¤Ê¤¤¤³¤È¤¬Á°Äó
"noremap <silent> J Jx
noremap <silent> <C-f> <C-f>zz
noremap <silent> <C-b> <C-b>zz

" ÊÔ½¸ -------------------------------------------------------------
nnoremap Y y$
noremap # :call ToggleCommentSelection()<CR>
inoremap <C-z> <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
cnoremap <C-z> <C-r>*
inoremap <C-b> <left>
inoremap <C-f> <right>
inoremap <C-d> <Del>
inoremap <expr> <C-r>! Which("")
" ¥¨¥ó¥¿¡¼¤ÇÊä´°·èÄê
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
" ¾ï¤Ë¤É¤ì¤«¤Î¹àÌÜ¤¬ÁªÂò¤µ¤ì¤Æ¤¤¤ë¤è¤¦¤Ë¤¹¤ë
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
" .h Ãæ¤Î´Ø¿ô¤ÎÀë¸À¤Ø¥¸¥ã¥ó¥×
nnoremap gh ebyw:AS<CR>/<C-R>"<CR>
" ÁªÂòÈÏ°Ï¤ÎÃ±¸ì¤òÃÖ´¹
vnoremap s y:%s/\<<C-R>"\>//g<Left><Left>
vnoremap <C-g> y:grepadd! -w <C-r>" *.<C-r>=expand("%:e")<cr>
" ¥«¡¼¥½¥ë²¼¤ÎÃ±¸ì¤òÄ¾Á°¤Ë¥ä¥ó¥¯¤·¤¿¤â¤Î¤ÇÃÖ¤­´¹¤¨¤ë delete & put
nnoremap cp diw"0P
nnoremap R gR 
vnoremap "#y :call YankWithLineNumber()<CR> 
nnoremap <silent> d<CR> :call DeleteBlankLines()<CR>
nnoremap \<C-a> <C-a>
nnoremap Q gqap
vnoremap Q gq
" <C-u>¤ò¥¢¥ó¥É¥¥¤Ç¤­¤ë¤è¤¦¤Ë¤¹¤ë¡£insert.jax»²¾È
inoremap <C-u> <C-G>u<C-u>
inoremap <C-w> <C-G>u<C-w>
inoremap <C-k> <C-o>D<Esc>
onoremap q /["',.{}()[\]<>]<CR>
nnoremap ,h :noh<CR>

" ¥Ð¥Ã¥Õ¥¡¡¦¥¦¥£¥ó¥É¥¦ ----------------------------------------------
nnoremap <Space>l :hide bn!<CR>
nnoremap <Space>h :hide bp!<CR>
nnoremap <Space>i :IncBufSwitch<CR>
nnoremap <silent> <Space>q :pc <bar> cclose <bar> noh<CR>
nnoremap <Space>d :Bclose<CR>
nnoremap <silent> <Tab> <C-w>w
nnoremap <silent> <space><Tab> <C-w>W
nnoremap <C-h> <C-w>W
nnoremap <space>r :MRU<CR>
nnoremap <space>f :FuzzyFinderFile<CR>
noremap gf gF
if exists(":ZoomWin")
  nnoremap <C-w>o :ZoomWin<CR>
else
  nnoremap <C-w>o :echomsg "ZoomWin is not installed." <bar> only<CR>
endif

" ¥×¥í¥°¥é¥ß¥ó¥°
nnoremap <C-c><C-c> :mak<CR>
nnoremap <C-x><C-x> :Run<CR>
nnoremap <C-c><C-t> :Maketag<CR>
nnoremap <silent> <C-x>e :call ExecText(getline("."))<CR>
inoremap <silent> <C-x>e <C-o>:call ExecText(getline("."))<CR><right>
vnoremap <silent> <C-x>e :call ExecText(GetSelectedText())<CR>
nnoremap <silent> <C-x>E :call ExecText(GetParagraphText())<CR>
inoremap <silent> <C-x>E <C-o>:call ExecText(GetParagraphText())<CR>
nnoremap <silent> <F6> :call GUExec('./a.out', '[./a.out]', 0)<CR> 
nnoremap <silent> \<F6> :call GUExecSetCmd(&ft)<CR>
nnoremap <silent> <C-^> :A<CR>

" ¥Õ¥¡¥ó¥¯¥·¥ç¥ó¥­¡¼¤Ï¤É¤ì¤Ë²¿¤ò³ä¤êÅö¤Æ¤¿¤«³Ð¤¨¤Å¤é¤¤
" F5-F8 ¥×¥í¥°¥é¥ß¥ó¥°´ØÏ¢
nnoremap <F2> :call BufInfo()<CR>
nnoremap g<F2> :call FileInfo(expand("<cfile>"))<CR>
nnoremap <F3> i<Tab><Esc>
"map <F4> :emenu <C-Z>
nnoremap <F4> :runtime macros/vimsh.vim<CR>
" (<F5> ¤Ï¥Õ¥¡¥¤¥ë¥¿¥¤¥×Ëè¤Ë¾å½ñ¤­¤µ¤ì¤ë)
nnoremap <F5> :call ShebangExecute()<CR>
nnoremap <F6> :Maketag<CR>
nnoremap <F7> :Tlist<CR>
" µ¡Ç½¥È¥°¥ë
nnoremap <F11> :let &virtualedit=(&ve == "" ? "all" : "")<CR>:set virtualedit<CR>
nnoremap <F12> :set foldenable!<CR>:set foldenable?<CR>
nnoremap <Home> :set hls!<CR>:set hls?<CR>
nnoremap <End>  :set list!<CR>:set list?<CR>
nnoremap <PageUp> :let &ts=&ts*2>8?2:&ts*2<CR>:set ts?<CR>
nnoremap \cu :set cursorcolumn!<CR>

" ¤½¤ÎÂ¾ ----------------------------------------------------------- 

" ¥³¥Þ¥ó¥É¥é¥¤¥ó
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <expr> <C-d> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")
cnoremap <C-f> <Right>
cnoremap <expr> <C-g> (getcmdtype()=="/" \|\| getcmdtype()=="?") ? ".*" : "\<C-a>"
cnoremap <C-k> <Home>\<<End>\><Left><Left>
cnoremap <C-@> <C-r>=expand("%")<CR>
cnoremap <C-t> <C-r>=g:topdir<CR>/
cabbrev <expr> prog (getcmdpos()==(strlen("prog")+1)&&getcmdtype()==":") ? "grep -R " . g:topdir : "prog"

function! CommandCabbr( abbreviation, expansion )
  exe 'cabbr <expr> ' . a:abbreviation . ' (getcmdpos()==1&&getcmdtype()== ":")?"' . a:expansion . '":"' . a:abbreviation . '"'
endfunction
command! -nargs=+ CommandCabbr call CommandCabbr( <f-args> ) 


" ÆüËÜ¸ì  ---------------------------------------------------------
if $TERM =~ "kterm"
  set enc=euc-jp
elseif $LANG =~? "utf-8"
  set enc=utf-8
else
  set enc=japan
endif
set fencs=euc-jp,iso-2022-jp,cp932,utf-8 
set ambiwidth=double

" ¥Õ¥¡¥¤¥ë --------------------------------------------------------
"set backup
"set backupdir=~/.bak
set directory=~/.swap
set hidden
set noautoread
set suffixes-=.h
" = ¤ò¥Õ¥¡¥¤¥ëÌ¾¤Î°ìÉô¤ÈÇ§¼±¤·¤Ê¤¤
set isfname-==
set confirm

" ÊÔ½¸ ------------------------------------------------------------ 
set autoindent smartindent
set smarttab
set tabstop=8 softtabstop=4 shiftwidth=4
set shiftround
set cinoptions=t0,:0,g0,(0
set backspace=indent,eol,start
set formatoptions=tcqnmM
set listchars=tab:^\ 
set iskeyword+=-
set indentkeys-=0#
set virtualedit=block
set diffopt+=iwhite
set clipboard=unnamed
set pastetoggle=<F10>

" ¥«¡¼¥½¥ë°ÜÆ° -----------------------------------------------------
set showmatch matchtime=1
set matchpairs+=<:>
set whichwrap+=h,l,<,>,[,],b,s,~
set sidescroll=1
set sidescrolloff=4
set nostartofline

" É½¼¨ -------------------------------------------------------------
set nowrap
set ruler
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
set statusline=%f:%{substitute(getcwd(),'.*/','','')}\ %m%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B
set showcmd
set report=0
set cmdheight=1
set laststatus=2
set nonumber
set shortmess+=I
set nofoldenable
set notitle noicon
set vb t_vb=
" --MORE-- ¤òÉ½¼¨¤·¤Ê¤¤
"set nomore
set lazyredraw

" ¸¡º÷ -------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set keywordprg=man\ -a
nnoremap \e :!ej <C-r><C-w>
runtime ftplugin/man.vim
nnoremap K :Man <C-r><C-w><CR>
" »È¤¤Êý¡§ :grep hoge *
set grepprg=grep\ -nr\ $*\ /dev/null\ --exclude=*.svn-base
set tags+=*.tags,tags;,~/tmp/tmptags
set path+=/usr/ports/Mk,/usr/local/include

" Êä´°¡¦ÍúÎò -------------------------------------------------------
set wildmenu
set history=50
set showfulltag
set wildoptions=tagfile
set cdpath+=~

" ¥¦¥£¥ó¥É¥¦ -------------------------------------------------------
set splitbelow
set splitright
set sessionoptions+=resize
set previewheight=5
set helpheight=14

" ¥Þ¥¦¥¹ -----------------------------------------------------------
set mouse=
set ttymouse=xterm

let g:vimsh_split_open = 0

let g:netrw_liststyle=3
let g:netrw_cygwin=1

"let g:snippetsEmu_key = "<C-j>"
let chalice_preview = 0
let chalice_exbrowser = 'firefox %URL% &'
"let g:chalice_verbose = 2
hi 2chThreadQuote1 ctermfg=2
command! EditBookmark e ~/.vim/chalice/chalice.bmk
command! ExtBrowser ChaliceHandleJumpExt
command! DoWrite ChaliceDoWrite
set runtimepath+=$VIM/chalice
runtime plugin/chalice.vim

" yankring
let g:yankring_replace_n_pkey = 'yp'
let g:yankring_replace_n_nkey = 'yn'

" ¥³¥Þ¥ó¥ÉÄêµÁ
command! Utf8 e ++enc=utf-8
command! Euc e ++enc=euc-jp
command! Sjis e ++enc=cp932
command! Jis e ++enc=iso-2022-jp
command! WUtf8 w ++enc=utf-8 | e
command! WEuc w ++enc=euc-jp | e
command! WSjis w ++enc=cp932 | e
command! WJis w ++enc=iso-2022-jp | e
command! Nkf !nkf -g %
command! -nargs=0 Scratch if exists("g:scratch_bufnr") && bufexists(g:scratch_bufnr) | exe "b " . g:scratch_bufnr | else | new | setlocal bt=nofile bh noswf | let g:scratch_bufnr=bufnr("%") | endif
command! -nargs=0 OutBuf new | setlocal bt=nofile nobuflisted noswf 
command! -nargs=* Gxx set makeprg=g++\ $GXXFLAGS\ <args>\ % | make
command! -nargs=* Gcc set makeprg=gcc\ $GCCFLAGS\ <args>\ % | make
command! Doc new $VIMRUNTIME/doc/usr_toc.txt
command! Ev e ~/.vimrc
command! O sp ~/.vim/output | normal! <C-w>k
command! AA AS
command! VA AV
command! Li call CommentCaption("-")
command! LLi call CommentCaption("=")
command! Mkinl :sp %<.inl
command! TmpTag !ctags -f ~/tmp/tmptags %:p

function! CommentCaption(ch)
  let fo_save = &fo
  set fo=
  if !exists("b:commentSymbol")
    let b:commentSymbol = "//"
  endif
  set paste
  execute "normal! o" . b:commentSymbol
  execute "normal! 77a" . a:ch
  execute "normal! o" . b:commentSymbol . "   "
  execute "normal! o" . b:commentSymbol
  execute "normal! 77a" . a:ch
  normal! =2kj$
  set nopaste 
  let &fo = fo_save
  startinsert!
endfunction
command! FB call FunctionDescription()
command! SB call FileDescription()
command! WhatColor echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
command! CD cd %:p:h 
command! Fixdir let g:fixdir=getcwd()
command! Top exe "cd " . g:topdir
command! Settop call Settop(getcwd())

function! Settop(dir)
  let g:topdir = a:dir
endfunction

function! SettopProjectDir()
  let projects = {"es-trunk" : "/var/www/html/es-trunk/app" }
  let cwd = getcwd()
  for key in keys(projects)
    if stridx(cwd, key) >= 0
      call Settop(projects[key])
      return
    endif
  endfor
  call Settop(cwd)
endfunction
                                            
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction!

function! AutoLoadSession()
  let g:sessionfile = getcwd() . "/Session.vim"
  if (argc() == 0 && filereadable(g:sessionfile))
    echohl WarningMsg
    echo "Session file exists. Load this? (y/n): "
    echohl None
    while 1
      let c = getchar()
      if c == char2nr("y")
        so Session.vim
        return
      elseif c == char2nr("n")
        return
      endif
    endwhile
  endif
endfunction 

function! AutoSaveSession()
  if exists(g:sessionfile)
    exe "mks! " . g:sessionfile
  endif
endfunction

" ¥ª¡¼¥È¥³¥Þ¥ó¥É
augroup AutoLoadSettion
  au!
  au VimEnter * call AutoLoadSession()
  au VimLeave * call AutoSaveSession() 
augroup END

augroup MyAutocmd
  au!
  au FileType vim_shell call VimShell_Setting()
  au FileType php call PHP_Setting()
  au BufReadPost *.thtml,*.inc set ft=php
  au InsertLeave * set nopaste
  au BufReadPost * if &modifiable && search('[^ -~\t]', 'wcn', 200) == 0 | set fenc= | endif
  au FileChangedShell * call OnFileChangedShell(expand("<afile>"))
  au VimEnter * if filereadable("lvimrc") | so lvimrc | endif
  au FileType vim   call Vim_Setting()
  au FileType python call Python_Setting()
  au FileType haskell call Haskell_Setting()
  au FileType lisp call Lisp_Setting()
  au FileType javascript call JavaScript_Setting()
  au BufNewFile *.cl call append(0, ["#!/usr/bin/env clisp"])
  au BufNewFile *.py call append(0, ["#!/usr/bin/env python", "# -*- coding: utf-8 -*-", "import logging", "", "logging.basicConfig(level=logging.DEBUG, format='%(levelname)s: %(message)s')"])|set fenc=utf-8 nomodified
  au BufNewFile,BufReadPost  *.c,*.h,*.cpp,*.d,*.java   let b:commentSymbol="//"
  au BufNewFile *.java 0r ~/.vim/java-template
  au FileType  lua let b:commentSymbol="--"
  au BufNewFile *.rb call append(0, "#!/usr/bin/env ruby") | call append(2, "require 'aorubylib'") | normal! G
  au BufNewFile *.pl call append(0, "#!/usr/bin/env perl") |  normal! G
  au BufWritePost * if strpart(getline(1),0,2) == "#!" | exe "silent! !chmod +x % 2>/dev/null" | endif
  au BufWritePost * if &ft == "" | filetype detect | endif 

  au FileType make setlocal list noexpandtab
  au BufNewFile,BufReadPost *tags set list ts=16
  au FileType qf setlocal nobuflisted
  au FileType qf syn match qfError "warning" contained
  au FileType qf nnoremap <buffer> p <CR><C-w>wj
  au FileType qf call AdjustWindowHeight(12)

  au FileType help set sts=8|set indentkeys-=0{| hi LongLine guibg=#ffff00 | match LongLine /\%80c/ | hi Ignore ctermfg=1 guifg=#ff0000 | syn match Error /^</
  au FileType help nnoremap <buffer> <C-p> ?^'<CR> | nnoremap <buffer> <C-n> /^'<CR>
  au FileType lisp let b:commentSymbol=';'

  au FileType c call C_Setting() 
  au FileType cpp call Cpp_Setting() 
  au FileType ruby call Ruby_Setting() 
  au FileType 2ch_threadlist,2ch_bookmark nnoremap <silent> + :call ToggleThreadWindowSize()<CR>
  au FileType 2ch_threadlist,2ch_bookmark nnoremap <silent> <CR> :call EnlargeThreadWindow()<CR>
  autocmd Syntax * call s:MySyntax() 

  au BufNewFile,WinEnter * hi ZenkakuSpace guibg=NONE gui=underline guifg=#90e09f| match ZenkakuSpace /¡¡/

  au BufNewFile *.h,*.inl call IncludeGuard() 
  au FileType scheme call Scheme_Setting()
  "au QuickfixCmdPost make,grep,grepadd,vimgrep call PostQuickfixCmd()
  "au BufWritePost *.js sil! make | redraw!
  "au QuickfixCmdPost l* lw
  au Filetype html call HTML_Setting()
  au BufNewFile,BufReadPost *.bas set ft=vb
  au FileType vb call VB_Setting()
  au BufNewFile *.html call LoadTemplate("html")
  au BufNewFile *.vbs call LoadTemplate("vbs")
  au BufNewFile *.scm call LoadTemplate("scm")
  " ºÇ¸å¤ËÊÔ½¸¤·¤¿¾ì½ê¤Ë°ÜÆ°
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  au BufEnter __Tag_List__ nunmap <buffer> <Tab>
  au BufWritePost .Xdefaults call ConfirmXrdb()
augroup END

augroup AutoCd
  au VimEnter * call SettopProjectDir()
  au BufLeave * let g:oldcwd=getcwd()
  au BufEnter * if !exists('g:fixdir') && &buftype != "help" && isdirectory(expand("%:p:h")) |lcd %:p:h |endif
  let g:oldcwd=''
augroup END

function! PostQuickfixCmd()
  let l = len(getqflist())
  if l > 0
    if l < 12
      if l < 4 | let l = 4 | endif
      exe l . "cw"
    else
      cw
    endif
  else
    cclose
  endif
endfunction

function! OpenLocationListWindow()
  let l = len(getloclist(0))
  if l < 12
    if l < 4 | let l = 4 | endif
    exe l . "lw"
  else
    lw
  endif
endfunction

function! s:MySyntax()
  syn keyword Return    return exit         | hi Return         cterm=bold      ctermfg=1 ctermbg=None gui=bold guifg=red
  syn keyword Break     break               | hi Break          cterm=None      ctermfg=1 ctermbg=None gui=None guifg=#0000ff
  syn keyword Continue  continue            | hi Continue       cterm=bold      ctermfg=3 ctermbg=None gui=None guifg=#007F7F
  syn keyword Debug     DEBUG debug dprintf | hi Debug          cterm=underline ctermfg=1 ctermbg=None gui=bold guifg=#ff00ff guibg=#ffffff
  syn keyword Fallthrough fallthrough       | hi Fallthrough    cterm=None      ctermfg=3 ctermbg=None gui=underline guifg=red 
  syn keyword cppPublic   public            | hi cppPublic      cterm=None      ctermfg=2 ctermbg=None gui=None guifg=#0000ff
  syn keyword cppPrivate  protected private | hi cppPrivate     cterm=bold      ctermfg=3 ctermbg=None gui=None guifg=#006600 ctermfg=darkred
  syn match   Operator /\(&&\|||\|==\)/
endfunction

" ³°Éô¤Ç¥Õ¥¡¥¤¥ë¤¬ÊÑ¹¹¤µ¤ì¤¿¤È¤­¸Æ¤Ð¤ì¤ë
function! OnFileChangedShell(afile)
  if v:fcs_reason == "time"
    echomsg "Info: The timestamp of this file has changed."
    let v:fcs_choice = ""
  elseif v:fcs_reason == "deleted"
    if &modified == 0
      if confirm("The file " . a:afile . " is deleted. Delete this buffer?", "&Yes\n&No\n") == 1
        exe "b " . a:afile 
        bd
      endif
      let v:fcs_choice = ""
    else
      echomsg "The file " . a:afile . " is deleted."
      let v:fcs_choice = ""
    endif
  elseif v:fcs_reason == "mode" 
    let v:fcs_choice = "reload"
  else
    let v:fcs_choice = "ask"
  endif 
endfunction

"============================================================================
" ¥Õ¥¡¥¤¥ë¥¿¥¤¥×ÊÌ¤ÎÀßÄê
"============================================================================

function! C_Setting()
  setlocal isk&
  "setlocal ts=4 sts=4 sw=4 noet
  setlocal fo-=o
  setlocal tags+=/usr/include/tags,/usr/include/sys/tags
  nnoremap <buffer> <F5> :Run<CR>
  " Á°¸å¤Î´Ø¿ô¤Ø°ÜÆ° Wed Jan  5 2005
  noremap <buffer> <silent> <C-p> [[?^\s*$<CR>jz<CR>:call HilightFunctionName()<CR>:noh<CR>
  noremap <buffer> <silent> <C-n> /^\s*$<CR>]]?^\s*$<CR>jz<CR>:call HilightFunctionName()<CR>:noh<CR>
  " ¥¤¥ó¥Ç¥ó¥È¥ì¥Ù¥ë¤ò¹ç¤ï¤»¤ÆÅ½¤êÉÕ¤±
  nnoremap <buffer> p p=`]`]
  "nnoremap <buffer> n n:redraw<CR>:echo WhatFunction()<CR>
  "nnoremap <buffer> N N:redraw<CR>:echo WhatFunction()<CR>
  iab <buffer> switch switch () {<CR>}<Up><C-o>$<C-o>F)<C-r>=Eatchar('\s')<CR>
  iab <buffer> case case x:<CR>break;<Up><BS><BS><BS>
  iab <buffer> default: default:<CR>break; <Up>
  inoremap <expr> <CR> ElectricEnter() 
  setlocal statusline=%f:%{substitute(getcwd(),'.*/','','')}\ %m[%{WhatFunction()}]%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B
  let b:match_words = &matchpairs 

  " ´Ø¿ô¤òÈÏ°ÏÁªÂò
  nnoremap <buffer> vf ][v[[?^s*$<CR>
  " for ¤Ê¤É¤Î¥Ö¥í¥Ã¥¯¤òÁªÂò¡£¥«¡¼¥½¥ë°ÌÃÖ¤ò for ¤Î¹Ô¤Ë¤ª¤¯É¬Í×¤¬¤¢¤ë¡£
  nnoremap <buffer> vb /{<CR>%v%0
  " £±¤Ä¤Î°ú¿ô¤òÁªÂò
  nnoremap <buffer> vaa ?\(,\\|(\)<CR>lv/\(,\\|)\)<CR>
  nmap <buffer> caa vaac
endfunction 

function! Cpp_Setting()
  call C_Setting()
endfunction

function! PHP_Setting()
  let b:commentSymbol = "//"
  setlocal autoindent
  setlocal et list ts=2 sts=2 sw=2
  setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),=EO,=else,=cat,=fina,=END,0\\
  set formatoptions=nmMqrowcb
  nnoremap <buffer> <F5> :!php %<CR>
  nnoremap <C-^> :call ToggleMVC()<CR>
endfunction

function! VimShell_Setting()
  setl ts=8
  inoremap <buffer> <C-p> <C-x><C-l>
  augroup Vimsh
    au!
    "au BufEnter * if &ft=="vim_shell" | startinsert! | endif
  augroup END
endfunction

function Scheme_Setting()
  vnoremap <silent> <buffer> <CR> "vy:call VimshExecCmd("scheme", "")<CR><Esc>
  nnoremap <silent> <buffer> <CR><CR> mA"vya):call VimshExecCmd("scheme", "")<CR><Esc>`A
  inoremap <silent> <buffer> <C-x><C-e> x<Esc>mz:call search(')','bc')<CR>"vy%`zmA:call VimshExecCmd("scheme", "")<CR><Esc>`A
  nnoremap <silent> <buffer> <F6> :call GUExec('gosh', 'Scheme', 1)<CR>
  nnoremap <silent> <buffer> <F5> :!gosh < %<CR>
  nnoremap <silent> <buffer> <F3> ==j
  onoremap <buffer> s a)
  nnoremap <buffer> vs va)
  nnoremap <buffer> \p p:'[,']s@^@; @g<CR>`[2li=> <Esc>:noh<CR>
  let b:commentSymbol = ";"
  setl sw=2 sts=2 ts=2
  let $PAGER="cat"
  let @d = '#?='
  " use, load ¤·¤Æ¤¤¤ë¥Õ¥¡¥¤¥ë¤òÊä´°ÂÐ¾Ý¤Ë´Þ¤á¤ë¡£gf ¤Ê¤É¤Ë¤â´Ø·¸¡£
  setlocal suffixesadd=.scm
  setlocal include=(use\ \\\|(load\
  setlocal includeexpr=substitute(substitute(v:fname,'\\./','','g'),'\\.','/','g')
  setlocal path+=/usr/share/gauche/0.8.12/lib
endfunction

function! Python_Setting()
  setl nosmartindent
  setl et list
  setlocal statusline=%f:%{substitute(getcwd(),'.*/','','')}\ %m[%{Py_WhatFunction()}]%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B 
  " :h errorformat /python ¤è¤ê
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  "nnoremap <silent> <buffer> <C-x>r :call GUExec('python', 'Python', 1)<CR>
  nnoremap <silent> <buffer> <F6> :call GUExec('python', 'Python', 1)<CR>
  nnoremap <buffer> K :call system("s http://www.python.jp/doc/2.4/lib/module-<C-r><C-w>.html")<CR>
endfunction

function! Ruby_Setting()
  setlocal ts=2 sts=2 sw=2
  comp ruby
  nnoremap <buffer> <F5> :make %<CR>
  iab <buffer> ei each_with_index
  nnoremap <silent> <buffer> <F6> :call GUExec('ruby', '[Ruby]', 0)<CR>
  nnoremap <buffer> K :call GUReference(expand('<cword>'), 'refe', '[refe]')<CR>:set ft=ruby<CR>
  vnoremap <buffer> K "zyw:call GUReference(@z, 'refe', '[refe]')<CR>:set ft=ruby<CR>
endfunction 

function! Haskell_Setting()
  setlocal ts=2 sts=2 sw=2
  setlocal list expandtab
  nnoremap <buffer> K :call GUReference(expand('<cword>'), 'href', '[href]')<CR>:set ft=haskell<CR>
  nnoremap <buffer> <F5> :!runghc %<CR>
  let b:commentSymbol = "--"
  setlocal fo -=o
  inoremap <expr> <C-j> InsertArrow()
endfunction

function! Lisp_Setting()
  setlocal ts=2 sts=2 sw=2
  setlocal list expandtab
  let b:commentSymbol = ";"
  nnoremap <silent> <buffer> <F6> :call GUExec('clisp', '[clisp]', 0)<CR>
endfunction

function! JavaScript_Setting()
  set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ % 
  set errorformat=%f(%l):\ %m
  if system("which js") != ""
    let g:js_interp = "js"
  else
    if has("win32")
      let g:js_interp = "cscript"
    endif
  endif
  let b:commentSymbol = "//"
  nnoremap <silent> <buffer> <F6> :call GUExec(g:js_interp, '[JavaScript]', 0)<CR>
endfunction

function! VB_Setting()
  set formatoptions+=ro
  nnoremap <buffer> [[ ?\<\(function\\|sub\\|property\)\>.*(<CR>:noh<CR>
  nnoremap <buffer> ]] /\<\(function\\|sub\\|property\)\>.*(<CR>:noh<CR>
  setlocal statusline=%f:%{substitute(getcwd(),'.*/','','')}\ %m[%{VB_WhatFunction()}]%=%{(&fenc!=''?&fenc:&enc).':'.strpart(&ff,0,1)}\ %l-%v\ %p%%\ %02B
endfunction

function! HTML_Setting()
  setlocal sw=2 sts=2 ts=4 et
  inoremap <C-r>c <C-r>=system("randcolor")<CR>
  nnoremap <buffer> <F5> :!s %<CR>
endfunction

function! VB_WhatFunction()
  let lnum = search('\<\(function\|sub\|property\)\>.*\(\w\+\)(', 'bcnW')
  if lnum == 0
    return "-"
  endif
  let line = getline(lnum) 
  if line =~ "declare function" || line =~ '^\s*'''
    return "-"
  endif
  return matchstr(line, '\w\+(\@=') 
endfunction

function! Vim_Setting()
  setlocal ts=2 sts=2 sw=2 
  setlocal et
  setlocal list
  setlocal tw=0
  nnoremap <buffer> <F5> :so %<CR>
  let b:commentSymbol="\""
  setlocal formatoptions-=o
  " ÁªÂò¤·¤¿ÈÏ°Ï¤ò vim ¥³¥Þ¥ó¥É¤È¤·¤Æ¼Â¹Ô¤¹¤ë
  nnoremap <space>e yy:@"<CR>
  vnoremap <space>e y:@"<CR>
endfunction

"============================================================================
" Grand Unified Programming Environment
" BUGS: ¤Þ¤À unify ¤·¤Æ¤¤¤ëÅÓÃæ¤Ç¤¢¤ë¡£
"============================================================================
function! GUReference(word, cmd, bufname)
  if a:word == ""
    let word = input("word: ")
  else
    let word = a:word
  endif
  call SingletonBuffer(a:bufname, 1)
  " ¥¸¥ã¥ó¥×¤·¤¿¤¢¤È``¤Ç¤â¤È¤Î¾ì½ê¤ËÌá¤ì¤ë¤è¤¦¤Ë¡£°Ê²¼¤Î¥³¥Þ¥ó¥É¤Ëkeepjump¤ò¤Ä¤±¤Æ¤â¥À¥á¤Ê¤Î¤Ç
  mark Z
  set bt=nofile noswf
  nnoremap <buffer> q :q<CR>
  nmap <buffer> <CR> K
  exe "normal! G3o\<Esc>78i=\<esc>"
  exe ":sil! r!" . a:cmd . " '" . escape(word, '!#') . "'"
  exe "normal! `Z`[z\<CR>"
endfunction


function! GUExecCmdWin(cmd, bufname)
  call SingletonBuffer(a:bufname, 1)
  lcd #:p:h
  set bt=nofile noswf 
  nnoremap <buffer> q :close<CR>
  normal! gg"_dG
  exe a:cmd
endfunction

function! GUExec(cmd, bufname, getError)
  let cmd = exists("g:GUExec_cmd") ? g:GUExec_cmd : a:cmd." ".expand("%")
  call GUExecCmdWin("sil .!".cmd, a:bufname)
  if line("$") < 4
    4wincmd _
    normal! gg
  endif 
  call AdjustWindowHeight(12)
  if a:getError
    cgetbuffer
    cw
  endif
endfunction

function! GUExecSetCmd(ft)
  let cmd = exists("g:GUExec_cmd") ? g:GUExec_cmd : " ".expand("%")
  let in = input("cmd: ", cmd)
  let g:GUExec_cmd = in
endfunction

function! IncludeGuard()
    let fl = getline(1)
    if fl =~ "^#if"
        return
    endif
    let basename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    normal! gg
    execute "normal! i#ifndef " . basename . "_INCLUDED"
    execute "normal! o#define " . basename .  "_INCLUDED\<CR>\<CR>\<CR>\<CR>\<CR>"
    execute "normal! Go#endif   /* " . basename . "_INCLUDED */"
    4
endfunction 

" ¸½ºß¹Ô¤ò¥³¥á¥ó¥È¥È¥°¥ë
" ÁªÂòÃæ¤Ï¤½¤ÎÈÏ°Ï¤ò
function! ToggleCommentSelection() range
  if exists('b:commentSymbol')
    let cs = b:commentSymbol
  else
    let cs = "#"
  endif 
  "let deleteCommentCommand = "normal! ^" . strlen(cs) . "x"
  let deleteCommentCommand = "s@" . cs . "@@e"

  let cl = a:firstline 
  let line = getline(cl)
  if strpart(line, match(line, "[^ \t]"), strlen(cs)) == cs
    let deleteComment = 1
  else
    let deleteComment = 0
  endif 

  while (cl <= a:lastline) 
    if deleteComment
      exe deleteCommentCommand
    else
      execute "normal! I" . cs
    endif
    normal! j
    let cl = cl + 1
  endwhile
endfunction

function! FunctionDescription()
  let indent = &et ? '    ' : "\t"
  let out = []
  call add(out, '/**')
  call add(out, indent . '@brief ')
  " 1¹Ô¾å¤¬¶õ¹Ô¤Ë¤Ê¤Ã¤Æ¤¤¤ë¤È¤³¤í¤Þ¤Ç°ÜÆ°
  exe "normal! ?^\\s*$\<CR>"
  " { ¤Þ¤Ç¤ò¥ä¥ó¥¯
  exe "normal! j\"zy/{\<CR>"
  let line = substitute(@z, '\n', '', 'g')
  let b = stridx(line, '(')
  let e = stridx(line, ')')
  " () ¤ÎÃæ¿È¤ò¼èÆÀ
  let innerParen = strpart(line, b+1, e-b-1)
  let fields = split(innerParen, ',')
  let params = []
  for f in fields
    " ¥Ý¥¤¥ó¥¿¤Î * ¤ò·¿Ì¾¤Ë¤¯¤Ã¤Ä¤±¤ë
    let f = substitute(f, '\*\s*', '* ', 'g')
    let f = substitute(f, '\s*\*', '*', 'g')
    " ÇÛÎó¤Î [] ¤ò¾Ãµî
    let f = substitute(f, '\[.*\]', '', 'g')
    " ¶õÇò¤Ç¶èÀÚ¤Ã¤¿ºÇ¸å¤¬²¾°ú¿ô
    call add(params, split(f)[-1])
  endfor
  let width = max(map(copy(params), 'strlen(v:val)'))
  for p in params
    " ²ÄÊÑÄ¹°ú¿ô¤Î ... ¤È void ¤Ï @param ¤Ë½ñ¤«¤Ê¤¤
    if p != '...' && p != 'void'
      call add(out, indent .'@param ' . p . repeat(' ', width-strlen(p)+1))
    end
  endfor
  let voidpos = match(line, '\<void\>')
  if voidpos >= 0 && voidpos < b
    call add(out, indent . "@return ¤Ê¤·")
  elseif line =~ '\<\(\w\+\)::\~\?\1\>'
    " ¥³¥ó¥¹¥È¥é¥¯¥¿¡¦¥Ç¥¹¥È¥é¥¯¥¿¤Ê¤é @return ¤Ï½ñ¤«¤Ê¤¤
  else
    call add(out, indent . "@return ")
  endif
  call add(out, '*/')
  call append(line(".")-1, out)
  exe "normal! ?brief \<CR>"
  startinsert!
endfunction

function! FileDescription() 
  normal gg
  set paste
  exe "normal! O/**************************************************************************//**"
  exe "normal! "  ." o    @file       " . expand("%")
  exe "normal! o    @brief      "
  exe "normal! o    @par        ÀâÌÀ" 
  exe "normal! o    @date       " . strftime("%Y-%m-%d")
  exe "normal! o    @author     AOYAMA Shotaro"
  exe "normal! o    @version    $Id" . "$"
  exe "normal! o    @note"
  exe "normal! o*//***************************************************************************/"
  set nopaste
  exe "normal ?@brief\<CR>"
  startinsert!
endfunction

iab cmain #include <stdio.h><cr>#include <stdlib.h><cr>#include <string.h><cr><cr>int main(int argc, char *argv[])<cr>{<cr>if (argc < 2) {<CR>fprintf(stderr, "Usage: %s FILE\n", argv[0]);<cr>exit(1);<cr>}<cr>return 0;<cr>}<Esc>{<down>
iab cppmain #include <stdio.h><cr>#include <stdlib.h><cr>#include <string.h><cr>#include <vector><cr>#include <list><cr>#include <map><cr>#include <algorithm><cr><cr>using namespace std;<cr><cr>int main(int argc, char *argv[])<cr>{<cr>return 0;<cr>}<Esc>{
inoremap <C-j> <Esc>/\(break;\\|{\\|}\)\s*$<CR>:noh<CR>o
iab date@ <C-r>=strftime("%Y-%m-%d")<CR>
iab time@ <C-r>=strftime("%H:%M")<CR>
iab datetime@ <C-r>=strftime("%Y-%m-%d %H:%M")<CR>
iab alerT alert
iab printF printf

function! VS() 
    setlocal errorformat=\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
    setlocal makeprg=devenv
endfunction


runtime macros/matchit.vim
let g:vimsh_split_open = 0

let g:explSortBy='date'
let $MRU="~/.vimrecent"
let MRU_Max_Entries = 30

cabbrev <expr> mr (getcmdtype()==":" ? "MRU" : "mr")


" ¥¦¥£¥ó¥É¥¦¤òÊÄ¤¸¤ë¤³¤È¤Ê¤¯¥Ð¥Ã¥Õ¥¡¤ò¥Ç¥ê¡¼¥È;
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete" . l:currentBufNum)
  endif
endfunction

" [I ¤·¤ÆÈÖ¹æÁª¤Ó¥¸¥ã¥ó¥×;
nnoremap [I :call UnderOccurences()<CR>
function! UnderOccurences()
exe "normal! [I"
let nr = input("Which one: ")
if nr == ""
    return
endif
exe "normal! " . nr . "[\t"
endfunction!

function! ConfirmXrdb()
  if confirm("xrdb this file?", "&Yes\n&No") == 1
    sil !xrdb %
  endif
endfunction

" ¥á¥Ë¥å¡¼ ---------------------------------------------------------
set wcm=<C-Z>

vmenu &Convert.Ascii->Hankaku :Hankaku<CR>
vmenu &Convert.Ascii->Zenkaku :Zenkaku<CR>
vmenu &Convert.AlphaNum->Hankaku gHW
vmenu &Convert.AlphaNum->Zenkaku gZW
vmenu &Convert.Katakana->Hankaku gHJ
vmenu &Convert.Katakana->Zenkaku gZJ
vmenu &Convert.Upcase U
vmenu &Convert.Downcase u
vmenu &Convert.FormatText gq 
vmenu &Convert.InsSpcZenHan :%s/\%(\([^\t -~]\)\%([!-~]\)\@=\|\([!-~]\)\%([^\t -~]\)\@=\)/\1\2 /g<CR>
  
function! Henkan() range
  echo "1. Á´³Ñ¤ÈÈ¾³Ñ¤Î´Ö¤Ë¥¹¥Ú¡¼¥¹¤òÁÞÆþ\n2. Á´³Ñ¢ªÈ¾³Ñ\n3. È¾³Ñ¢ªÁ´³Ñ\n4. ASCIIÊ¸»ú¢ªÈ¾³Ñ\n5. ¥«¥¿¥«¥Ê¢ªÁ´³Ñ\n6. ÂçÊ¸»ú¢ª¾®Ê¸»ú\n7. ¾®Ê¸»ú¢ªÂçÊ¸»ú\n8. À°·Á(gq)\n9. = ¤Ç¤½¤í¤¨¤ë(Req)\n10. camelCase -> camel_case\n11. camel_case -> camelCase"
  let nr = input(":")
  if nr == "1"
    '<,'>s/\%(\([^\t -~]\)\%([!-~]\)\@=\|\([!-~]\)\%([^\t -~]\)\@=\)/\1\2 /g 
  elseif nr == "2"
    '<,'>Zenkaku
  elseif nr == "3"
    '<,'>Hankaku
  elseif nr == "4"
    normal! gvgHH
  elseif nr == "5"
    normal! gvgZZ
  elseif nr == "6"
    normal! gvu
  elseif nr == "7"
    normal! gvU
  elseif nr == "8" 
    normal! gvgq
  elseif nr == "9"
    '<,'>Req
  elseif nr == "10"
    s@\(\l\)\(\u\)@\1_\l\2@g 
  elseif nr == "11"
    s@\(\w\)_\(\w\)@\1\u\2@g
  endif
endfunction

nnoremap <silent> H :<C-U>call HContext()<CR>
nnoremap <silent> L :<C-U>call LContext()<CR>
vnoremap <silent> H <Esc>:<C-U>call HContext()<CR>mzgv`z
vnoremap <silent> L <Esc>:<C-U>call LContext()<CR>mzgv`z
func! HContext()
  let c = col(".")
  let l = line(".")
  let w = winline()
  normal! H
  if c == col(".") && l == line(".") && w == winline()
    exe "normal! \<C-f>"
  endif
endfunc

func! LContext()
  let c = col(".")
  let l = line(".")
  let w = winline()
  normal! L
  if c == col(".") && l == line(".") && w == winline()
    exe "normal! \<C-b>"
  endif
endfunc


" ÁªÂòÈÏ°ÏÆâ¤«¤é¸¡º÷;
" ¤Á¤ã¤ó¤È n ¤ä N ¤â¤½¤ÎÈÏ°ÏÆâ¤À¤±¤Ë¤Ê¤ë;
function! RangeSearch(direction)
    call inputsave()
    let g:srchstr = input(a:direction)
    call inputrestore()
    if strlen(g:srchstr) > 0
        let g:srchstr = g:srchstr.
                    \ '\%>'.(line("'<")-1).'l'.
                    \ '\%<'.(line("'>")+1).'l'
    else
        let g:srchstr = ''
    endif
    set hls
endfunction
command! -nargs=0 -range RangeSearch call RangeSearch('/')|if strlen(g:srchstr) > 0|exe '/'.g:srchstr|endif
command! -nargs=0 -range RangeSearchBackward call RangeSearch('?')|if strlen(g:srchstr) > 0|exe '?'.g:srchstr|endif

" ¿ôÃÍ¤òÁý²Ã¤µ¤»¤Ê¤¬¤é¹ÔÊ£À½
nnoremap & :<C-U>call IncrementingCopy(v:count ? v:count : 1,"[", "]")<CR> 
function! IncrementingCopy(n, open, close)
  let i=0
  while i < a:n
    normal! yyp
    "s@\[[0-9]\+\]@\=(a:open.(strpart(submatch(0),1)+1).a:close)@ge 
    s@[0-9]\+@\=(submatch(0)+1)@ge 
    let i=i+1
  endwhile 
endfunction

function! Out(command)
  redir @c
  silent exe a:command
  redir END
  new
  0put c
  set buftype=nofile
  set bufhidden=delete
  call AdjustWindowHeight(12)
endfunction
command! -nargs=+ Out call Out("<args>")

" ÌµÌ¾¥ì¥¸¥¹¥¿¤ÎÆâÍÆ¤È¸½ºß¤ÎÁªÂòÈÏ°Ï¤Îdiff¤ò¤È¤ë;
command! -nargs=0 -range DiffClip <line1>, <line2>:call DiffClip(0)
function! DiffClip(reg) range
  exe "let @a=@" . a:reg
  exe a:firstline  . "," . a:lastline . "y b"
  new
  set buftype=nofile bufhidden=wipe
  put a
  diffthis
  vnew
  set buftype=nofile bufhidden=wipe
  put b
  diffthis 
endfunction

function! InsertIfdef() range
  let sym = input("symbol:")
  call append(a:firstline-1, "#ifdef " . sym)
  call append(a:lastline+1, "#endif // " . sym)
endfunction
command! -nargs=0 -range Ifdef <line1>, <line2>:call InsertIfdef()

"inoremap <CR> <CR><Space><Bs><Esc>mqk:call AfterEnter()<CR>`qa
function! AfterEnter()
  normal! ==
  " È¾³Ñ¡Ê¥À¥Ö¥ë¥¯¥©¡¼¥È½ü¤¯¡Ë¤ÈÁ´³Ñ¤Î´Ö¤Ë¥¹¥Ú¡¼¥¹¤òÁÞÆþ;
  sil! s/\%(\([^\t -~]\)\%([!#-~]\)\@=\|\([!#-~]\)\%([^\t -~]\)\@=\)/\1\2 /g 
endfunction

command! -nargs=1 JK call JK(<args>, <args>)
function! JK(jline, kline)
  exe "nnoremap j " . a:jline . "j"
  exe "nnoremap k " . a:kline . "k"
endfunction

" ´Ê°×¥Ð¥Ã¥Õ¥¡¥¨¥¯¥¹¥×¥í¡¼¥é
nnoremap <space>j :call MyBufExpl()<CR>

" :ls ¤Î·ë²Ì¤«¤é¥Ð¥Ã¥Õ¥¡ÈÖ¹æ¤ò¼è¤ê½Ð¤¹
function! ExtractBufferNbr(line)
  return matchstr(a:line, "\\d\\+") + 0
endfunction

" ÁªÂò¤·¤¿¥Ð¥Ã¥Õ¥¡¤ò³«¤¯
function! OpenThisBuffer()
  let bufno = ExtractBufferNbr(getline(".")) 
  close
  exe "b " . bufno
endfunction

" ¥Õ¥¡¥µ¡¼¥É
function! MyBufExpl()
  let current=expand("%:t")
  redir @z
  silent ls
  redir END
  new
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal cursorline
  nnoremap <buffer> <CR> :call OpenThisBuffer()<CR>
  nnoremap <buffer> dd :exe "bd " . ExtractBufferNbr(getline("."))<CR>dd:echo "Deleted the buffer."<CR>
  silent put z
  silent g/^\s*$/d
  call AdjustWindowHeight(999)
  setlocal hls
  call search(current)
endfunction

function! Bufsize()
  return line2byte(line("$") + 1) - 1
endfunction


function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1 
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||  a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal! " column . "|"
        return
      endif
    endif
  endwhile
endfunc 
" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<cr>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<cr>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<cr>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<cr>
vnoremap <silent> [l <esc>:call NextIndent(0, 0, 0, 1)<cr>m'gv''
vnoremap <silent> ]l <esc>:call NextIndent(0, 1, 0, 1)<cr>m'gv''
vnoremap <silent> [L <esc>:call NextIndent(0, 0, 1, 1)<cr>m'gv''
vnoremap <silent> ]L <esc>:call NextIndent(0, 1, 1, 1)<cr>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<cr>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<cr>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<cr>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<cr> 

function! GetBelowFunctionName(start, max)
  let cur=a:start
  while cur < a:start + a:max
    let cur = cur + 1
    let line = getline(cur)
    if line !~ '^\k'
      continue
    endif
    let m = matchstr(line, '\k\+(')
    if m != ""
      return strpart(m, 0, strlen(m)-1) 
    endif
  endwhile 
  return ""
endfunction

function! HilightFunctionName()
  let fn = GetBelowFunctionName(line("."), 20)
  if fn != ""
    exe "match Function /" . fn . "/"
  endif
endfunction


" ¾Ã¤·¤¿ÉôÊ¬°Ê³°¤òÆ°¤«¤µ¤Ê¤¤¤Ç cw
nnoremap <silent> \c :set opfunc=WhitenAndReplace<CR>g@
vnoremap <silent> \c :<C-U>call WhitenAndReplace(visualmode(), 1)<CR>

function! WhitenAndReplace(type, ...)
  let old_ve = &virtualedit
  set virtualedit=all
  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . visualmode() . "`>r\<space>"
  elseif a:type == 'line'
    silent exe "normal! '[V']r\<space>"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]r\<space>"
  else
    silent exe "normal! `[v`]r\<space>"
  endif
  let &virtualedit = old_ve
  startreplace
endfunction

" xterm ¾å¤Ç256¿§É½¼¨¤¹¤ë¤È¤­É¬Í×
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm

if $TERM =~? "kterm"
" kh ¤À¤±¤¦¤Þ¤¯¤¤¤«¤Ê¤¤¡£
  set t_kh=0 
  set t_kP=[5~
  set t_kN=[6~
endif

function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction

" screen + gdb ---------------------------------------------------- 
sign define br text=>> texthl=Search
" ¥«¥ì¥ó¥È¥Õ¥¡¥¤¥ë¤Î¥«¥ì¥ó¥È¹Ô¤Ë¥Ö¥ì¡¼¥¯¥Ý¥¤¥ó¥ÈÀßÄê
command! Breakpoint call Breakpoint() | se nu
command! ListBreakpoints sign place
let g:bpmap = {}
let g:bpsignplace = 0
function! Breakpoint()
  let pos = expand("%") . ":" . line(".")
  if !has_key(g:bpmap, pos)
    let g:bpsignplace += 1
    let g:bpmap[pos] = g:bpsignplace
    exe ":sign place " . g:bpsignplace . " line=" . line(".") . " name=br file=" .expand("%")
    call system("screen -X eval focus 'stuff \"b " . pos  . "\"\\015' focus")
  else
    exe ":sign unplace " . g:bpmap[pos]
    unlet g:bpmap[pos]
    call system("screen -X eval focus 'stuff \"clear " . pos  . "\"\\015' focus")
  endif
endfunction
nnoremap <F9> :call Breakpoint()<CR>

" ¥«¥ì¥ó¥È¥Õ¥¡¥¤¥ë¤Î¥«¥ì¥ó¥È¹Ô¥Ö¥ì¡¼¥¯¥Ý¥¤¥ó¥Èºï½ü
command! Clear call system("screen -X eval focus 'stuff \"clear " . expand("%") . ":" . line(".") . "\"\\015' focus")
" ¥¹¥Æ¥Ã¥×¼Â¹Ô
command! Step call system("screen -X eval focus 'stuff s\\015' focus")
" ¼Â¹ÔºÆ³«
command! Continue call system("screen -X eval focus 'stuff c\\015' focus")
" ¥¹¥Æ¥Ã¥×¼Â¹Ô(´Ø¿ôÆâ¤ËÆþ¤é¤Ê¤¤)¡£¤Ê¤ó¤È:Next¤Ï¤¹¤Ç¤ËÍ½Ìó¤µ¤ì¤Æ¤¤¤ë!
command! NextStep call system("screen -X eval focus 'stuff c\\015' focus") | +
" ¥«¥ì¥ó¥È¥Õ¥¡¥¤¥ë¤Î¥«¥ì¥ó¥È¹Ô¤Þ¤Ç¼Â¹Ô
command! Advance call system("screen -X eval focus 'stuff \"advance " . expand("%") . ":" . line(".") . "\"\\015' focus")
" ÊÑ¿ô¤ÎÃÍ¤òÉ½¼¨¡£¤Ê¤ó¤È:Print¤Ï¤¹¤Ç¤ËÍ½Ìó¤µ¤ì¤Æ¤¤¤ë!
command! -nargs=+ PrintVariable call system("screen -X eval focus 'stuff \"p " . "<args>" . "\"\\015' focus")

" ºÇ¸å¤Ë¥×¥Ã¥È¤·¤¿¥Æ¥­¥¹¥È¤ÎÁ°¸å¤Ë¥¹¥Ú¡¼¥¹¤òÁÞÆþ
nnoremap \<space> :call PutWithSpaces()<CR>
function! PutWithSpaces()
  let e = getpos("']")
  let addedCharLen = 0
  normal! `[
  let c = getline(".")[col(".")-2]
  if c != ' '
    exe "normal! i\<space>"
    let addedCharLen += 1
  endif
  let e[2] += addedCharLen
  call setpos(".", e)
  let c = getline(".")[col(".")]
  if c != ' '
    exe "normal! a\<space>"
  endif 
endfunction

function! BufInfo()
  echo "[bufnr     ] ".bufnr("%")
  echo "[bufname   ] ". expand("%:p")
  echo "[cwd       ] " . getcwd()
  if filereadable(expand("%"))
    echo "[mtime     ] " . strftime("%Y-%m-%d %H:%M %a",getftime(expand("%")))
  endif
  echo "[size      ] " . Bufsize() . " bytes"
  echo "[comment   ] " . (exists('b:commentSymbol') ? b:commentSymbol : "undefined")
  echo "[filetype  ] " . &ft
  echo "[tab       ] " . &ts . " (" . (&et ? "" : "no") . "expandtab)"
  echo "[keywordprg] " . &keywordprg
  echo "[makeprg   ] " . &makeprg
  echo "[Buffer local mappings]"
  nmap <buffer>
endfunction

function! FileInfo(filename)
  let fn = expand(a:filename)
  echo "[filename  ] " . fn
  echo "[type      ] " . getftype(fn)
  echo "[mtime     ] " . strftime("%Y-%m-%d %H:%M %a",getftime(fn))
  echo "[size      ] " . getfsize(fn) . " bytes"
  echo "[perm      ] " . getfperm(fn)
endfunction

function! Strip(str)
  return substitute(a:str, '\%(^\s\+\|\s\+$\)', '', 'g')
endfunction

function! LStrip(str)
  return substitute(a:str, '^\s\+', '', 'g')
endfunction

function! RStrip(str)
  return substitute(a:str, '\s\+$', '', 'g')
endfunction

nnoremap <silent><C-a> :cal SmartHome("n")<CR>
"nnoremap <silent><C-e> :cal SmartEnd("n")<CR>
inoremap <silent><C-a> <Esc>I
inoremap <silent><C-e> <Esc>A
vnoremap <silent><C-a> <Esc>:cal SmartHome("v")<CR>
"vnoremap <silent><C-e> <Esc>:cal SmartEnd("v")<CR>

"smart home function
function! SmartHome(mode)
  let curcol = col(".")

  if &wrap
    normal! g^
  else
    normal! ^
  endif
  if col(".") == curcol
    if &wrap
      normal! g0
    else
      normal! 0
    endif
  endif

  if a:mode == "v"
    normal msgv`s
  endif

  return ""
endfunction

"smart end function
function! SmartEnd(mode)
  let curcol = col(".")
  let lastcol = a:mode == "i" ? col("$") : col("$") - 1

  "gravitate towards ending for wrapped lines
  if curcol < lastcol - 1
    call cursor(0, curcol + 1)
  endif

  if curcol < lastcol
    if &wrap
      normal g$
    else
      normal $
    endif
  else
    normal g_
  endif

  "correct edit mode cursor position, put after current character
  if a:mode == "i"
    call cursor(0, col(".") + 1)
  endif

  if a:mode == "v"
    normal msgv`s
  endif

  return ""
endfunction 

function! ForwardWord()
  call search('\(\W\|^\)\w', 'e')
endfunction

function! BackwardWord()
  call search('\(\W\|^\)\w', 'be')
endfunction

function! ForwardParagraph()
  let cnt = v:count ? v:count : 1
  let i = 0
  while i < cnt
    if !search('^\s*\n.*\S','W')
      normal! G$
      return
    endif
    let i = i + 1
  endwhile
endfunction

function! DeleteBlankLines()
  if search('\S','bW')
    let b = line('.') + 1
  else
    let b = 1
  endif
  if search('^\s*\n.*\S', 'eW')
    let e = line('.') - 1
  else
    let e = line('$')
  endif
  if b == e
    exe b . "d"
  else
    exe (b+1) . "," . e  . "d"
    exe b
  endif
endfunction

function! GetProtoLine()
  let ret       = ""
  let line_save = line(".")
  let col_save  = col(".")
  let top       = line_save - winline() + 1
  let so_save = &so
  let &so = 0
  let istypedef = 0
  " find closing brace
  let closing_lnum = search('^}','cW')
  if closing_lnum > 0
    if getline(line(".")) =~ '\w\s*;\s*$'
      let istypedef = 1
      let closingline = getline(".")
    endif
    " go to the opening brace
    normal! %
    " if the start position is between the two braces
    if line(".") <= line_save
      if istypedef
        let ret = matchstr(closingline, '\w\+\s*;')
      else 
        " find a line contains function name
        let lnum = search('\w\+(','bcnW')
        if lnum > 0
          let ret = getline(lnum)
        endif
      endif
    endif
  endif
  " restore position and screen line
  exe "normal! " . top . "Gz\<CR>"
  call cursor(line_save, col_save)
  let &so = so_save
  return ret
endfunction


function! WhatFunction()
  if exists("b:WhatFunction_LastLine") && b:WhatFunction_LastLine == line(".")
    return b:WhatFunction
  endif
  let b:WhatFunction_LastLine = line(".")
  if &ft != "c" && &ft != "cpp"
    let b:WhatFunction = ""
    return ""
  endif 
  let proto = GetProtoLine() 
  if proto == ""
    let b:WhatFunction = "-"
    return "-"
  endif 
  if stridx(proto, '(') > 0
    let ret = matchstr(proto, '\w\+(\@=')
  elseif proto =~# '\<struct\>'
    let ret = matchstr(proto, 'struct\s\+\w\+')
  elseif proto =~# '\<class\>'
    let ret = matchstr(proto, 'class\s\+\w\+')
  else
    let ret = strpart(proto, 0, 15) . "..."
  endif 
  let b:WhatFunction = ret
  return ret
endfunction

function! GetProtoLinePy()
  let ret       = ""
  let line_save = line(".")
  let col_save  = col(".")
  let top       = line_save - winline() + 1
  let so_save = &so
  let &so = 0
  let istypedef = 0
  let lnum = search('^\s*\(def\|class\)','bncW')
  return getline(lnum)
endfunction


function! Py_WhatFunction()
  if exists("b:WhatFunction_LastLine") && b:WhatFunction_LastLine == line(".")
    return b:WhatFunction
  endif
  let b:WhatFunction_LastLine = line(".")
  let proto = GetProtoLinePy() 
  if proto == ""
    let b:WhatFunction = "?"
    return "?"
  endif 
  let ret = substitute(proto, '^\s*\(def\|class\)\s*', '', '')
  let ret = substitute(ret, '(.*', '', '')
  let b:WhatFunction = ret
  return ret
endfunction

function! YankWithLineNumber() range
  let a = ""
  let i = a:firstline
  while i <= a:lastline
    let a .= i . "    " . getline(i) . "\n"
    let i = i + 1
  endwhile
  call setreg('*', a, "l")
endfunction

function! Run2(defaultcmd)
  if !exists("g:run2_default_cmd") | let g:run2_default_cmd = "" | endif
  let cmd = input("run:" . substitute(getcwd(),g:home,'~','') . "$ ", g:run2_default_cmd, "shellcmd")
  if cmd == ""
    return -1
  endif
  call GUExec('sil .!'.cmd, '[Shell output]', 0)
  set buftype=nofile buflisted
  normal! z-
  let g:run2_default_cmd = cmd
  if line("$") == 1
    echo getline(".")
    close
  endif
endfunction
" Emacs ¤Î M-! ¤Ë¤«¤Ê¤ê¶á¤¤¥·¥§¥ë¼Â¹Ô¥³¥Þ¥ó¥É
command! Run2 call Run2("")


"-----------------------------------------------------------------------------
"   »ä²ÈÈÇ IncBufSwitch
"   - ¤è¤ê Emacs ¤Î iswitchb É÷¤Ë¤·¤¿
"   - C-c ¤Ç¤â¥­¥ã¥ó¥»¥ë¤Ç¤­¤ë¤è¤¦¤Ë¤·¤¿
"   - ¥¿¥Ö¤ÇÁªÂò¤Ç¤­¤ë¤è¤¦¤Ë¤·¤¿
"-----------------------------------------------------------------------------
if 1
command! IncBufSwitch :call IncBufferSwitch()
hi link IncBufSwitchCurrent  Search
hi IncBufSwitchOnlyOne cterm=reverse ctermfg=1 ctermbg=6 cterm=bold

function! PartialBufSwitch(partialName, first)
  let lastBuffer = bufnr("$")
  let g:ibs_buflist = ''
  let flag = 0
  let i = 1
  while i <= lastBuffer
    if (bufexists(i) != 0 && buflisted(i))
      let filename = expand("#" . i . ":t")
      if (match(filename, a:partialName) > -1)
        if flag == g:ibs_tabStop
          if a:first == 0
            let g:ibs_current_buffer = i
          endif
        endif
        let g:ibs_buflist = g:ibs_buflist .','. expand("#" . i . ":t")
        let flag = flag + 1
      endif
    endif
    let i = i + 1
  endwhile
  let g:ibs_buflist = substitute(g:ibs_buflist, '^,', '', '')

  if flag == g:ibs_tabStop + 1
    let g:ibs_tabStop = - 1
  endif
  return flag
endfunction

function! IncBufferSwitch()
  let origBufNr = bufnr("%")
  let g:ibs_current_buffer = bufnr("%")
  let partialBufName = ""
  let g:ibs_tabStop = 0

  let cnt = PartialBufSwitch('', 1)
  echon "ibs: "
  if cnt == 1
    echon ' {'
    echohl IncBufSwitchCurrent | echon g:ibs_buflist | echohl None
    echon '}'
  else
    echon ' {'. g:ibs_buflist .'}'
  endif

  while 1
    let flag = 0
    let rawChar = getchar()
    if rawChar == 13  " <CR>
      exe "silent buffer " . g:ibs_current_buffer
      break
    endif
    if rawChar == 27 || rawChar == 3 " <ESC> or <C-c>
      "echon "\r                                                                                   "
      let g:ibs_current_buffer = origBufNr
      break
    endif
    if rawChar == "\<BS>"
      let g:ibs_tabStop = 0
      if strlen(partialBufName) > 0
        let partialBufName = strpart(partialBufName, 0, strlen(partialBufName) - 1)
        if strlen(partialBufName) == 0
          let flag = 1
          if bufnr("%") != origBufNr
            let g:ibs_current_buffer = origBufNr
          endif
        endif
      else
        if bufnr("%") != origBufNr
          let g:ibs_current_buffer = origBufNr
        endif
        break
      endif
    elseif rawChar == 9 " TAB -- find next matching buffer
      let g:ibs_tabStop = (g:ibs_tabStop == -1) ? 0 : g:ibs_tabStop + 1
    else
      let nextChar = nr2char(rawChar)
      let partialBufName = partialBufName . nextChar
    endif

    let matchcnt = PartialBufSwitch(partialBufName, flag)
    if matchcnt == 0
      let partialBufName = strpart(partialBufName, 0, strlen(partialBufName) - 1)
      let matchcnt = PartialBufSwitch(partialBufName, flag)
    endif
    redraw
    echon "\ribs: " . partialBufName
    call ShowBuflist(partialBufName, matchcnt)
  endwhile
endfunction

function! ShowBuflist(partialName, matchcnt)
  let lastBuffer = bufnr("$")
  let i = 1
  let first = 1
  echon " {"
  while i <= lastBuffer
    if (bufexists(i) != 0 && buflisted(i))
      let filename = expand("#" . i . ":t")
      if (a:partialName != "" && match(filename, a:partialName) > -1)
        if first
          let first = 0
        else
          echon ","
        endif
        if (g:ibs_current_buffer == i)
          if a:matchcnt == 1
            echohl IncBufSwitchOnlyOne
          else
            echohl IncBufSwitchCurrent
          endif
        endif
        echon filename
        echohl None
      endif
    endif
    let i = i + 1
  endwhile
  echon "}"
endfunction
endif

command! ShowFunc call ShowFunc()
function! ShowFunc()
   let gf_s = &grepformat
   let gp_s = &grepprg

   let &grepformat = '%*\k%*\sfunction%*\s%l%*\s%f %*\s%m'
   let &grepprg = 'ctags -x --c-types=f --sort=no -o -'

   silent! grep %
   cwindow

   let &grepformat = gf_s
   let &grepprg = gp_s
endfunc

" {<CR> ¤òÆþÎÏ¤¹¤ë¤ÈÂÐ±þ¤¹¤ëÊÄ¤¸³ç¸Ì¤òÁÞÆþ
function! ElectricEnter()
  let l = getline(".")
  let len = strlen(l)
  if len + 1 == col(".") && l[len-1] == "{"
    return "\<CR>\<left>\<right>\<CR>}\<up>\<end>"
  else
    return "\<CR>"
  endif
endfunction

" :b ¤òÆþÎÏ¤¹¤ë¤È¼«Æ°Åª¤Ë¥Ð¥Ã¥Õ¥¡°ìÍ÷¤òÉ½¼¨¤¹¤ë¡£
function! CmdSpace()
  let l = getcmdline()
  if l ==# "b"
    return "\<C-u>ls\<CR>:b "
  else
    return "\<space>"
  endif
endfunction

au filetype mail nmap <spacE>l :bd<CR>j<CR>
au filetype mail nmap <spacE>l :bd<CR>j<CR>}z<CR>

command! SetEnterCommand call SetEnterCommand()
function! SetEnterCommand()
  let g:entercmd = input("command: ")
  nnoremap <CR> :let w=expand("<cWORD>")<CR><C-w>wG:let @a=system(g:entercmd." ".w)<CR>"ap
endfunction

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

function! MakeGLVS()
  if !isdirectory("~/.vim/GetLatest") | call mkdir("~/.vim/GetLatest", "p") | endif
  let list = ["ScriptID SourceID Filename", "--------------------------"]
  call add(list, "521  1 :AutoInstall: mru.vim")
  call add(list, "1658 1 NERD_tree.vim")
  call add(list, "508  1 ZoomWin.vim")
  call add(list, "31   1  a.vim")
  return writefile(list, expand("~")."/.vim/GetLatest/GetLatestVimScripts.dat") 
endfunction

" NERDTree
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = "-" 
augroup NERDTree
  au!
  au BufWinEnter *_NERD_tree_ | nmap <buffer> <CR> o
augroup END

function! Which(cmd)
  if a:cmd == ""
    let cmd = input("which: ")
  else
    let cmd = a:cmd
  endif
  let ret = system("which " . cmd)
  " ËöÈø¤Î^@¤òºï½ü
  let ret = ret[0:-2]
  return ret
endfunction


" ==========================================================================
" ¢§ ¶¦ÄÌ¤Ë»È¤¦¥é¥¤¥Ö¥é¥ê´Ø¿ô
" ==========================================================================
function! GetSelectedText()
  let a_save = @a
  silent normal! gv"ay
  let selected = @a
  let @a = a_save
  return selected
endfunction

function! GetParagraphText()
  exe "normal! vip\<Esc>"
  return GetSelectedText()
endfunction

" »ØÄê¤·¤¿Ì¾Á°¤ò»ý¤Ä¥Ð¥Ã¥Õ¥¡¤¬´û¤ËÂ¸ºß¤¹¤ë¤Ê¤é¤½¤³¤Ë¥«¡¼¥½¥ë¤ò°ÜÆ°¡£
" Â¸ºß¤·¤Ê¤¤¤Ê¤éºîÀ®¡£
function! SingletonBuffer(name, split)
  " Ê¸»ú¤ò¥¨¥¹¥±¡¼¥× :h file-pattern
  let name=escape(a:name, '[]*?,\')
  if bufexists(a:name) " bufexists ¤Ë¤Ï¥¨¥¹¥±¡¼¥×É¬Í×¤Ê¤¤
    let bufnr = bufnr(name)
    let winlist = WindowContains(bufnr)
    if empty(winlist)
      if a:split 
        split 
      endif
      exe "b " . bufnr
    else
      exe winlist[0] . "wincmd w"
    endif
  else
    if a:split
      exe "sil new " . escape(name, ' ')
    else
      exe "sil e " . escape(name, ' ')
    endif
  endif
endfunction

" »ØÄê¤·¤¿¥Ð¥Ã¥Õ¥¡¤ò´Þ¤ó¤Ç¤¤¤ë¥¦¥£¥ó¥É¥¦ÈÖ¹æ¤Î¥ê¥¹¥È¤òÊÖ¤¹¡£
function! WindowContains(bufnr)
  return filter(range(1, winnr("$")), 'winbufnr(v:val)==' . a:bufnr)
endfunction

function! AdjustWindowHeight(maxheight)
  exe min([line("$") + 1, a:maxheight]) . "wincmd _"
endfunction

" ==========================================================================
" ¢¥ ¶¦ÄÌ¤Ë»È¤¦¥é¥¤¥Ö¥é¥ê´Ø¿ô
" ==========================================================================

function! ExecText(str)
  if &ft == "vim"
    let a_save = @a
    let @a = a:str
    @a
    let @a = a_save 
  endif
endfunction

function! ExecTextToString(str)
  redir => result
  call ExecText(str)
  return result
endfunction


nnoremap <C-x><C-n> :call CallNavi()<CR>
function! CallNavi()
  if exists("*Navi")
    call Navi()
  else
    echomsg "navi.vim ¤¬¥¤¥ó¥¹¥È¡¼¥ë¤µ¤ì¤Æ¤¤¤Ê¤¤¤è¤¦¤Ç¤¹¡£"
  endif
endfunction

" Cygwin
if filereadable("/cygwin.bat")
  colorscheme aoyama_cyg
  nnoremap <silent> <C-\> :let @"=expand("%:p")<CR>:call system("echo\ ".expand("%:p")."\|putclip")<CR>:echo @"<CR>
  nnoremap <F5> :call system('cygstart "'.expand("%:p").'"')<CR>
  set fencs=euc-jp,iso-2022-jp,utf-8,cp932 
else
  colorscheme aoyama_bsd
  nnoremap <C-\> :call setreg('*',expand("%:p"),'l')<CR>
  " ¤Ê¤¼¤«¥¤¥ó¥µ¡¼¥È¥â¡¼¥É¤Ç¤Ï¸ú¤«¤Ê¤¤
  noremap <silent> <MiddleMouse> <esc>:set paste<CR>:put *<CR>:set nopaste<CR>
endif


nnoremap <C-w>gf :call GfInOtherWindow()<CR>
function! GfInOtherWindow()
  if winnr("$") != 1
    only
  endif
  sp
  normal! gF
endfunction

"nnoremap <CR> :call OpenInOtherWindow()<CR>
function! OpenInOtherWindow()
  let fname = b:cwd . "/" . getline(".")
  wincmd w
  exe "e " . fname
endfunction

command! DR call Dire()
function! Dire()
  topleft vnew
  25wincmd |
  r!find . \! \( \( -name .svn -o -name CVS \) -prune \) -type f
  set ve=all
  setlocal bt=nofile noswf 
  let b:cwd = getcwd()
  echomsg "Press <F11> to disable virtualedit."
endfunction

function! RemoveLastSearchHistory()
  call histdel("search", -1)
  let @/=histget("search", -1)
  nohlsearch
endfunction

function! LoadTemplate(ext)
  let fname = $HOME . "/.vim/template." . a:ext
  if filereadable(fname)
    exe "0r " . fname
  endif
endfunction

function! InsertArrow()
  let line = getline(".")
  let c = line[col(".")-1]
  if c == ""
    let c = line[col(".")-2]
  endif
  if c == " "
    return "-> "
  else
    return " -> "
  endif
endfunction

" Christian J. Robinson <infynity@onewest.net>
" http://www.vim.org/scripts/script.php?script_id=1928
command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")
function! Rename(name, bang)
  let l:curfile = expand("%:p")
  let v:errmsg = ""
  silent! exe "saveas" . a:bang . " " . a:name
  if v:errmsg =~# '^$\|^E329'
    if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
      silent exe "bwipe! " . l:curfile
      if delete(l:curfile)
        echoerr "Could not delete " . l:curfile
      endif
    endif
  else
    echoerr v:errmsg
  endif
endfunction

function! OpenVimsh(bufname, cmd)
  new
  if !exists("g:vimsh_loaded_python_file")
    runtime macros/vimsh.vim
  endif
  exe "VimShNewBuf " . a:bufname
  call VimshExecCmd(a:bufname, a:cmd)
endfunction

function! VimshExecCmd(bufname, cmd)
  let oldwinnr = winnr()
  if !bufexists("_".a:bufname."_")
    call FtOpenVimsh(a:bufname)
  endif
  call SingletonBuffer("_".a:bufname."_", 1)
  if a:cmd != ""
    let g:cmd = 'python lookup_buf("_' . a:bufname . '_").execute_cmd(["' . escape(a:cmd, '"') . '"])'
  else
    let g:cmd = 'python lookup_buf("_' . a:bufname . '_").execute_cmd([vim.eval("@v")])'
  endif
  exe g:cmd
  exe oldwinnr."wincmd w"
endfunction

let g:vimshdic = {"ruby": ["ruby", "irb"],
      \ "scheme": ["scheme", "gosh -i"]
      \ }
function! FtOpenVimsh(ft)
  let a = g:vimshdic[a:ft]
  call OpenVimsh(a[0], a[1])
endfunction

nnoremap <C-c>s :sil! call FtOpenVimsh(&ft)<CR>


" TODO:
" opfunc <CR> ¤òºî¤ë
" ¥â¡¼¥·¥ç¥ó¤Ç»ØÄê¤·¤¿ÎÎ°è¤ò¥¤¥ó¥¿¡¼¥×¥ê¥¿¤ËÁ÷¤ë

command! View call EditView()
function! EditView()
  let f = expand("%:p")
  let viewfile = substitute(f, '\.php', '_v.inc', '')
  exe "e " . viewfile
endfunction
command! Controller call EditController()
function! EditController()
  let f = expand("%:p")
  let viewfile = substitute(f, '_v\.inc', '.php', '')
  exe "e " . viewfile
endfunction
function! ToggleMVC()
  let f = expand("%:p")

  if f =~ '_v\.inc'
    call EditController()
  else
    call EditView()
  endif
endfunction
