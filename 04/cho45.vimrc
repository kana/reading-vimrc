
syntax on

if &term =~ "xterm-256color"
	colorscheme desert256
	" omini..
	highlight Pmenu ctermbg=8
	highlight PmenuSel ctermbg=12
	highlight PmenuSbar ctermbg=0
endif

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

"ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロールバー、スクロールバーのつまみ部分）
highlight Pmenu ctermbg=6 guibg=#4c745a
highlight PmenuSel ctermbg=3 guibg=#d4b979
highlight PmenuSbar ctermbg=0 guibg=#333333
"highlight PmenuThumb ctermbg=0 guibg=Red

set listchars=tab:>.
set list

set directory=~/swp
let g:hatena_user          = 'cho45'
let g:hatena_group_name    = 'subtech'

let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username   = "SATOH Hiroh <cho45@lowreal.net>"
let g:changelog_date_end_entry_search = '^\s*$'

let g:Perl_AuthorName      = 'cho45'
let g:Perl_AuthorRef       = ''
let g:Perl_Email           = 'cho45@lowreal.net'
let g:Perl_Company         = ''

" zsh っぽい補完に
"
set wildmode=longest,list

" ちゃんと文字書いて○とか
set ambiwidth=double

" ポップアップメニューをよしなに
set completeopt=menu,preview,longest,menuone

" 補完候補の設定
set complete=.,w,b,u,k

" バックアップとか自分でしろ
set nobackup

" 誰かが編集したら読み直して
set autoread

" 袖あまりは良いものだ
set scrolloff=10000000
" 行番号の表示
set number
" デフォルトインデント設定
set autoindent smartindent
" よさげなタブ
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
" BS の挙動
set backspace=indent,eol,start

" よしなにしてくれ
set ignorecase smartcase
" インクメンタル
set incsearch
" 最初にもどれ
set wrapscan

" 対応する括弧の表示
set showmatch
" 入力中のコマンドを表示
set showcmd

" 行頭・行末間移動を可能に
set whichwrap=b,s,h,l,<,>,[,]

" 補完候補を表示する
set wildmenu

set splitbelow

set nrformats="hex"

" ステータス表示用変数
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}%=%l,%c%V%8P

set termencoding=utf-8
set encoding=utf-8
set fileencodings=cp932,euc-jp,iso-2022-jp

set hidden

set viminfo+=!

set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>

filetype plugin on
filetype indent on

" mapping

inoremap  <BS>

nnoremap j gj
nnoremap k gk
" nmap gb :ls<CR>:buf 

" sort css property (id:secondlife)
nmap gso vi{:!sortcss<CR>
vmap gso i{:!sortcss<CR>


" encoding
nmap <silent> eu :set fenc=utf-8<CR>
nmap <silent> ee :set fenc=euc-jp<CR>
nmap <silent> es :set fenc=cp932<CR>

" encode reopen encoding
nmap <silent> eru :e ++enc=utf-8 %<CR>
nmap <silent> ere :e ++enc=euc-jp %<CR>
nmap <silent> ers :e ++enc=cp932 %<CR>


"for yanktmp.vim
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" redraw map
nmap <silent> sr :redraw!<CR>

" cmode
cmap <ESC>h <Left>
cmap <ESC>l <Right>


"if has("mac")
	map <silent> sY :call YankPB()<CR>
	function! YankPB()
		let tmp = tempname()
		call writefile(getline(a:firstline, a:lastline), tmp, 'b')
		silent exec ":!cat " . tmp . " | pbcopy"
	endfunction
"endif

" execute script
nmap ,e :call ShebangExecute()<CR>

" indent whole buffer
noremap <F8> gg=G``

" xml close tag comp
" autocmd FileType html,xhtml,xml :inoremap </ </<C-X><C-O>

" insert timestamp
nmap tw :exe "normal! i" . strftime("%Y-%m-%d\T%H:%M:%S+09:00")<CR>

"nmap bg :BufferExplorer<CR>
"nmap bG :FilesystemExplorerFromHere<CR>
"nmap gb :FilesystemExplorer<CR>

let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'MruFile':{}, 'FavFile':{}, 'Dir':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.ignore_case = 1
let g:FuzzyFinderOptions.File.abbrev_map  = {
      \   '\C^VP' : [
      \     '$VIMRUNTIME/plugin/',
      \     '~/.vim/plugin/',
      \     '$VIM/.vim/plugin/',
      \     '$VIM/vimfiles/plugin/',
      \   ],
      \   '\C^VC' : [
      \     '$VIMRUNTIME/colors/',
      \     '~/.vim/colors/',
      \     '$VIM/.vim/colors/',
      \     '$VIM/vimfiles/colors/',
      \   ],
      \ }
let g:FuzzyFinderOptions.MruFile.max_item = 50

nmap bg :FuzzyFinderBuffer<CR>
nmap bG :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nmap gb :FuzzyFinderFile<CR>
nmap br :FuzzyFinderMru<CR>

nmap <unique> g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
nmap ga :silent exec ':Ack ' . substitute(getreg('/'), '\v\\\<(.*)\\\>', "\\1", '')<CR>



augroup MyAutocmd
	au!
	autocmd BufWritePost * if getline(1) =~ "^#!" | exe "silent !chmod +x %" | endif
	autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe '!echo -n "k%\\"' | endif

	" YAML setting
	autocmd FileType yaml setlocal expandtab ts=2 sw=2 enc=utf-8 fenc=utf-8
	autocmd BufEnter * set nowrap


	" auto cd
	" autocmd BufEnter * exe ":lcd \"" . expand("%:p:h") . "\""

	" use 'encoding' if the buffer doesn't contain any multibyte character.
	autocmd BufReadPost *
				\   if &modifiable && !search('[^\x00-\x7F]', 'cnw')
				\ |   setlocal fileencoding=
				\ | endif
augroup END


" flex
augroup Fcsh
	au!
"	autocmd BufWritePost *.{as,mxml} call FcshCall()
augroup END

function! FcshCall()
	let ret = system('ruby -rdrb/drb -e "puts DRbObject.new_with_uri(''druby://localhost:8787'').call(ARGV[0])"  "'.expand("%:p").'"')
	if matchstr(ret, 'Error') != ""
		echo ret
	endif
endfunction


function! ShebangExecute()
	let m = matchlist(getline(1), '#!\(.*\)')
	if(len(m) > 2)
		execute '!'. m[1] . ' %'
	else
		execute '!' &ft ' %'
	endif
endfunction

" vim -b : edit binary using xxd-format!
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | silent %!xxd -g 1
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | silent %!xxd -g 1
	au BufWritePost *.bin set nomod | endif
augroup END

augroup Indent
	au!
	au BufNewFile,BufRead *yuno/* set expandtab softtabstop=4 tabstop=4 shiftwidth=4
augroup END

" {{{ Autocompletion using the TAB key

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<TAB>"
	else
		if pumvisible()
			return "\<C-N>"
		else
			return "\<C-N>\<C-P>"
		end
	endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}} Autocompletion using the TAB key

set iminsert=0 imsearch=0

set nofoldenable
set lazyredraw
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

let g:AutoComplPop_CompleteOption = '.,w,b,k'
let g:snippetsEmu_key = "<C-B>"

autocmd BufNewFile,BufRead *.io set filetype=io
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git fenc=utf-8 | AutoComplPopDisable

autocmd BufNewFile,BufRead */hatena/* setlocal expandtab

nnoremap <C-c>  :<C-u>close<CR>


function! Smartchr(fallback_literal, ...)
	let args = reverse(copy(a:000))
	call add(args, a:fallback_literal)
	let args = map(args, 'type(v:val) == type("") ? [0, v:val] : v:val')

	for i in range(len(args) - 1)
		let [pattern1, literal1] = args[i]
		let [pattern2, literal2] = args[i+1]

		if pattern1 is 0
			if search('\V' . escape(literal2, '\') . '\%#', 'bcn')
				return repeat("\<BS>", len(literal2)) . literal1
			endif
		else
			throw 'FIXME: pattern is not implemented yet: ' . string(args[i])
		endif
	endfor

	return a:fallback_literal
endfunction


