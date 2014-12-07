" 一時ファイルの格納先
" set directory=/Users/hika/desktop/tmp
" set backupdir=/Users/hika/desktop/tmp

" 一時ファイルを作成しない
set noswapfile
set nobackupdir

set nocompatible
filetype off

"vimでファイルを編集可能にする
set modifiable
set write

" ウインドウの幅
set columns=140
" ウインドウの高さ
set lines=45

" NeoBundleの設定
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/solarized'
"NeoBundle 'Shougo/surround'
"NeoBundle 'Shougo/lightline.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
filetype indent on


" 基本設定
set nocompatible " vi互換を解除する
set clipboard=unnamed " クリップボードを使用する
set backspace=indent,eol,start " Backspaceで削除を可能にする

"色の設定
if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
	let g:hybrid_use_Xresources = 1
  colorscheme hybrid
endif
set background=dark
syntax on

" 画面表示の設定
set number " 行番号を表示する
set cursorline " カーソル行を強調表示する
set laststatus=2 " ステータス行を常に表示する
"set list " 不可視文字を表示する
"set listchars=tab:»\ ,trail:~ " 不可視文字の表示文字を設定する
"highlight SpecialKey ctermfg=grey " 不可視文字の文字色を指定する

" タブとインデントの設定
set autoindent " 自動インデントを有効にする
set tabstop=2 " タブ幅を設定する
set shiftwidth=2 " インデント幅を設定する

" 検索の設定
set hlsearch " 検索文字列をハイライトする

" スニペットの設定
et g:go_snippet_engine = "neosnippet"

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

"Vimfilerの設定
nnoremap <C-e> :VimFiler -buffer-name=explorer -simple -split -winwidth=35 -toggle -no-quit<Cr>
autocmd VimEnter * VimFiler -simple -split -simple -winwidth=35 -no-quit
let g:vimfiler_edit_action = 'tabopen'

"NERDTreeの設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" 隠しファイルをデフォルトで表示させる
"let NERDTreeShowHidden = 1 
" デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'

"セーフモード無効化
let g:vimfiler_safe_mode_by_default = 0


NeoBundleCheck
