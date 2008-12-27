" settings {{{
filetype plugin indent on
set encoding=utf-8
set termencoding=utf-8
set fileencodings=euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set number
set ruler
set autoindent
set nosmartindent
set nocindent
set shiftwidth=2
set tabstop=2
set expandtab
set hlsearch
set splitbelow
set splitright
set switchbuf=useopen
set background=dark
syntax on
set wildmode=list:longest
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set hidden
set autoread
set title
set backspace=indent,eol,start




" }}}
" mappings {{{
"let mapleader=" "
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

nnoremap vv <C-v>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

nnoremap <Space>w :<C-u>write<Return>
nnoremap <Space>q :<C-u>quit<Return>
nnoremap <Space>Q :<C-u>quit!<Return>
nnoremap <Space>. :<C-u>new ~/git/dotfiles/vimrc<Cr>
nnoremap <Space>p :<C-u>setl wrap!<Cr>
nnoremap <Space>h :help<space>
nnoremap <Space>n :<C-u>new<space>
nnoremap <Space><Space> :<C-u>bn<Cr>
noremap <Space>j <C-f>
noremap <Space>k <C-b>

inoremap <C-t> 「」<left>
inoremap <C-t><C-t> 【】<left>
nnoremap ち a
inoremap <C-h> <left>
inoremap <C-l> <right>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

"nnoremap <Space>a  <Nop>
nnoremap <Space>an  :<C-u>tabnew<CR>
nnoremap <Space>ac  :<C-u>tabclose<CR>
nnoremap <Space>aj  :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <Space>ak  gT

nnoremap Y y$
nnoremap co zo
nnoremap cc zc

inoremap <Tab> <C-n>
nnoremap <Space>s :setfiletype<Space>
nnoremap <Space>v :new ~/.vim/
nnoremap <Space>I $i
nnoremap <Space>C $xa
nnoremap X ^x




"}}}
" kana's AlternateCommand {{{
command! -nargs=* AlternateCommand  call s:cmd_AlternateCommand([<f-args>])
function! s:cmd_AlternateCommand(args)
  let buffer_p = (a:args[0] ==? '<buffer>')
  let original_name = a:args[buffer_p ? 1 : 0]
  let alternate_name = a:args[buffer_p ? 2 : 1]

  if original_name =~ '\['
    let [original_name_head, original_name_tail] = split(original_name, '[')
    let original_name_tail = substitute(original_name_tail, '\]', '', '')
  else
    let original_name_head = original_name
    let original_name_tail = ''
  endif
  let original_name_tail = ' ' . original_name_tail

  for i in range(len(original_name_tail))
    let lhs = original_name_head . original_name_tail[1:i]
    execute 'cnoreabbrev <expr>' lhs
    \ '(getcmdtype() == ":" && getcmdline() ==# "' . lhs  . '")'
    \ '?' ('"' . alternate_name . '"')
    \ ':' ('"' . lhs . '"')
  endfor
endfunction "}}}
command! SplitNicely  call s:split_nicely() " {{{
function! s:split_nicely()
  if 80*2 * 15/16 <= winwidth(0)  " FIXME: threshold customization
    vsplit
  else
    split
  endif
endfunction " }}}

augroup MyVim
  autocmd!
  autocmd FileType vim nnoremap gs :source %<Cr>
augroup END

command! Big wincmd _ | wincmd |
AlternateCommand big Big
AlternateCommand man Man

AlternateCommand sp  SplitNicely
AlternateCommand vsp SplitNicely

" fuzzyfinder {{{
nnoremap <silent> <Space>ff :<C-u>FuzzyFinderFile<Cr>
nnoremap <silent> <Space>fm :<C-u>FuzzyFinderMruFile<Cr>
nnoremap <silent> <Space>fr :<C-u>FuzzyFinderBuffer<Cr>
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.key_open = '<C-j>'
let g:FuzzyFinderOptions.Base.key_open_split = '<Space>'
let g:FuzzyFinderOptions.Base.key_open_vsplit = '<CR>'
" }}}


" smartchr
augroup MySmartchr
  autocmd!
  autocmd FileType javascript inoremap <expr> \  smartchr#one_of('function(', '\')
augroup END

if has('mac') " {{{
  " Option+Arrow keys
  set <xRight>=OC
  set <xLeft>=OD
  set <xUp>=OA
  set <xDown>=OB
  nnoremap <xRight> <C-w>>
  nnoremap <xLeft> <C-w><LT>
  nnoremap <xUp> <C-w>+
  nnoremap <xDown> <C-w>-

  " Arrow keys
  nnoremap [C l
  nnoremap [D h
  nnoremap [A <C-b>
  nnoremap [B <C-f>
  " Shift+Arrow keys (actually I cannot use it on a terminal)
  nnoremap O2C :bn<Cr>
  nnoremap O2D :bp<Cr>
  nnoremap O2A i上<Esc>
  nnoremap O2B i下<Esc>
  " arrow and arrow keys
  nnoremap [B[B <C-w>j
  nnoremap [A[A <C-w>k
endif " }}}

"set formatoptions=tcq

" motemen's
command! -range=% Source split `=tempname()` | call append(0, getbufline('#', <line1>, <line2>)) | write | source % | bdelete

" http://subtech.g.hatena.ne.jp/secondlife/20080603/1212489817
"let git_diff_spawn_mode=1
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git
let g:git_diff_spawn_mode = 2

au BufRead,BufNewFile *.io setfiletype io

" edn to end
autocmd FileType ruby iabbrev edn end

" set filetype=twitter and then...
autocmd FileType twitter inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#%') . '" >&/dev/null &'<Cr>o

autocmd FileType mixiim inoremap <buffer> <CR> <Esc>2GdG:<C-u>MixiEchoGet<Cr>ddO
autocmd FileType mixispam inoremap <buffer> <Cr> <Esc>:<C-u>MixiEcho<Cr>o

autocmd FileType spamspam inoremap <buffer> <silent> <Cr> <Esc>:execute '!twitter post "' . escape(getline('.'), '"!#') . '" >&/dev/null &'<Cr>:<C-u>MixiEcho<Cr>o

" irb
autocmd FileType irb inoremap <buffer> <silent> <Cr> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<Cr>jo
nnoremap <Space>irb :<C-u>vnew<Cr>:setfiletype irb<Cr>

" quickrun
let g:quickrun_direction = 'rightbelow vertical'
nmap <Space>r  <Plug>(quickrun)
nmap <Space>R <Plug>(quickrun)<C-w>p
" function! Quickrun_open_test_window()
"   new
"   setfiletype ruby
"   execute "normal <Plug>(quickrun)"
"   execute "normal <C-w>H<C-w>7_"
"   execute "normal <C-w>p"
"   q!
" endfunction


" for git-vim (motemen) {{{
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :GitDiff --cached<Enter>
nnoremap <Space>gD :GitDiff<Enter>
nnoremap <Space>gs :GitStatus<Enter>
nnoremap <Space>gl :GitLog<Enter>
nnoremap <Space>ga :GitAdd<Enter>
nnoremap <Space>gA :GitAdd <cfile><Enter>
nnoremap <Space>gc :GitCommit<Enter>
" }}}

" F5 to --
"augroup LatexSuite
"  au LatexSuite User LatexSuiteFileType
"   \ imap <silent> <buffer> -- <Plug>Tex_FastEnvironmentInsert
"augroup END

" TeX Supports {{{

" beamer.tex support
let g:Tex_FoldedSections = 'part,chapter,section,%%fakesection,frame,'
            \. 'subsection,subsubsection,paragraph'

" flymake/tex
augroup FlymakeTex
  autocmd!
  autocmd BufWritePost *.tex silent !rake tex &>/dev/null &
augroup END

augroup MyTexImaps
  autocmd!
  autocmd FileType tex imap <buffer> :i <A-i>
  autocmd FileType tex imap <buffer> :l <A-l>
  autocmd FileType tex imap <buffer> :j <C-j>
  autocmd FileType tex imap <buffer> :5 <F5>
  autocmd FileType tex inoremap <buffer> :d $
  autocmd FileType tex inoremap <buffer> :p %
  autocmd FileType tex inoremap <buffer> :h ^
  autocmd FileType tex inoremap <buffer> :u _
  autocmd FileType tex inoremap <buffer> :[ {
  autocmd FileType tex inoremap <buffer> :] }
  autocmd FileType tex setl grepprg=grep\ -nH\ $*
  autocmd FileType tex setl makeprg=rake
augroup END
" }}}

augroup MyKeywordprg
  autocmd!
  autocmd FileType twitter setl keywordprg=dictionary
augroup END

" save with growl
"nnoremap <Space>w :<C-u>write<Return>:<C-u>silent !growlnotify -n vim -m '[write] %' >&/dev/null<Return>:echo expand('%')<Return>
"nnoremap <Space>q :<C-u>silent !growlnotify -n vim -m '[quit] %' >&/dev/null<Return>:<C-u>quit<Return>

set cursorline
"set cursorcolumn

" html {{{
function! s:HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction
function! s:HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction
vnoremap <silent> <space>e :call <SID>HtmlEscape()<CR>
vnoremap <silent> <space>ue :call <SID>HtmlUnEscape()<CR>
" }}}

" for quicklaunch {{{
let g:quicklaunch_commands = [
      \   'ls',
      \   'ls -a',
      \   'ls -l',
      \   'ruby check_gmail.rb',
      \   'twitter timeline',
      \   'port outdated',
      \   '',
      \   '',
      \   '',
      \   'tail -n 30 ~/.zsh_history'
      \ ]
for i in range(10)
  execute "silent! nmap <unique> <Space>" . i . "  <Plug>(quicklaunch-" . i . ")"
endfor
silent! nmap <unique> <Space>l  <Plug>(quicklaunch-list)
" }}}

" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}

" <space>ao move current buffer into a new tab.
nnoremap <silent> <Space>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>

" via guyon
command! CD execute ":lcd " . expand("%:p:h")

" open lib and corresponding test at a new tab {{{
command! -nargs=1 Lib  call s:open_lib_and_corresponding_test(<f-args>)
AlternateCommand lib Lib
function! s:open_lib_and_corresponding_test(fname)
  execute 'tabnew lib/' . a:fname . '.rb'
  execute 'vnew test/' . a:fname . '_test.rb'
  execute "normal \<Plug>(quickrun)\<C-w>J\<C-w>7_"
endfunction " }}}

" for textobj-indent
onoremap ii ii<C-o>

let g:gist_clip_command = 'pbcopy'

" __END__  "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
