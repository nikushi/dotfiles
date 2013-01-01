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

" Key Remap
noremap <C-x>r :!ruby %<Enter>

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
Bundle 'thinca/vim-ref'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'taka84u9/vim-ref-ri'
Bundle 'ujihisa/quickrun'
Bundle 'kien/ctrlp.vim'
Bundle 'itspriddle/vim-marked'
"Bundle 'Shougo/vimfiler'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
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
