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
" neocomplete
"   ^n                    次の候補
"   ^p                    前の候補
"   ^]                    キャンセル
"
" ctrl-p
"
"   ^p F5                Refresh file list to show
"
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,sjis,euc-jp

" Enable https://github.com/altercation/vim-colors-solarized
syntax on
set background=dark
colorscheme solarized

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [%p%%]\ [%l,%c]

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
autocmd BufNewFile,BufRead *.cap    set filetype=ruby
autocmd BufNewFile,BufRead *.md     set filetype=markdown
autocmd BufNewFile,BufRead *.gs     set filetype=javascript
" ファイルタイプに応じた設定
autocmd FileType perl set shiftwidth=4 tabstop=4 expandtab 
autocmd FileType cgi  set shiftwidth=4 tabstop=4 expandtab 
autocmd FileType ruby set shiftwidth=2 tabstop=2 expandtab 

" Settings for go
autocmd FileType go   set shiftwidth=4 tabstop=4 noexpandtab 
" By :make, run go build
autocmd FileType go   set makeprg=go\ build\ 
" When :w, do gofmt
au BufWritePre *.go Fmt
set rtp+=$GOROOT/misc/vim

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

Bundle 'Shougo/neocomplete.vim'

Bundle 'thinca/vim-ref'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'taka84u9/vim-ref-ri'
Bundle 'ujihisa/quickrun'
Bundle 'kien/ctrlp.vim'
Bundle 'itspriddle/vim-marked'
Bundle 'vim-perl/vim-perl'
Bundle 'slim-template/vim-slim'
Bundle 'jelera/vim-javascript-syntax'
"Bundle 'Shougo/vimfiler'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
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
"  neocomplete
" -----------------------
let g:neocomplete_enable_at_startup = 1
let g:neocomplete_enable_smart_case = 1
let g:neocomplete_enable_underbar_completion = 1
let g:neocomplete_min_syntax_length = 3
" For go
if !exists('g:neocomplete_omni_patterns')
  let g:neocomplete_omni_patterns = {}
endif
let g:neocomplete_omni_patterns.go = '\h\w*\.\?'
