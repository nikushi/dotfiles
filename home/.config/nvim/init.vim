set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,sjis,euc-jp
filetype on
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set incsearch
set smartcase
set smartindent
set laststatus=2
let g:netrw_winsize = 25

set statusline=%F%m%r%h%w\ [%Y]%=%l/%L\ [%p%%]\ %c

set splitbelow
set splitright

" newtr
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

" define file type by ext name
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType ruby set shiftwidth=2 tabstop=2 expandtab 

" settings per file type
autocmd FileType ruby set shiftwidth=2 tabstop=2 expandtab 
autocmd FileType python set shiftwidth=4 softtabstop=4 tabstop=8 expandtab
autocmd FileType go   set shiftwidth=4 tabstop=4 noexpandtab 
" By :make, run go build
autocmd FileType go   set makeprg=go\ build\ 

"
" vim-plug a vim package manager
"
call plug#begin('~/.local/share/nvim/plugged')

" List plugins managed by vim-plug
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<cr>
" with :CR, change project by incremental search
command! CR call fzf#run({
  \ 'sink': 'lcd',
  \ 'source': 'ghq list -p'
  \})


" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

call plug#end()
"
" End of vim-plug initialization
"
