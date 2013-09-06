" カンペ
"
" ウインドウ関連
"   ^w + >                ウインドウを右方向にリサイズ
"   ^w + <                ウインドウを左方向にリサイズ
"
" スクロール
"   ^f, ^b                1画面スクロール
"   ^u, ^d                画面半分スクロール
"   ^e, ^y                1行スクロール
"
" 複数行コメントアウト
"   ^v + jk範囲選択, I, #, Esc
"
" perldoc, rdoc参照
"   shift + k             モジュール名にカーソルを合わせた状態で
"
" ショートカット
"   ^d => $, ^a => @, ^e => =      $,@,=を打ちやすく
"
" Quickrun 
"   \ + r                 Run quickrun on the new window
"
" neocomplcache
"   ^n                    次の候補
"   ^p                    前の候補
"   ^]                    キャンセル
"
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,sjis,euc-jp

syntax on

filetype on
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set incsearch
set number
set smartcase
set smartindent

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [%l,%c]

" Quickrun 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" ^d => $, ^a => @, ^e => =
inoremap <C-d> $
inoremap <C-a> @
inoremap <C-e> =

" psgiなどの拡張子をファイルタイプに紐付ける
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead *.ru      set filetype=ruby
" ファイルタイプに応じた設定
autocmd FileType perl set shiftwidth=4 tabstop=4 expandtab 
autocmd FileType cgi  set shiftwidth=4 tabstop=4 expandtab 
autocmd FileType ruby set shiftwidth=2 tabstop=2 expandtab 

" config for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

""" My Bundles here:
"""
""" original repos on github
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'

Bundle 'Shougo/neocomplcache'

Bundle 'thinca/vim-ref'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'taka84u9/vim-ref-ri'
Bundle 'ujihisa/quickrun'
Bundle 'kien/ctrlp.vim'
Bundle 'itspriddle/vim-marked'
Bundle 'vim-perl/vim-perl'
Bundle 'slim-template/vim-slim'
"Bundle 'Shougo/vimfiler'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-bundler'
"""" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
""" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" END of config for vundle
"
"
" -----------------------
"  neocomplcache
" -----------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

