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
" Tab
"   vim -p file1 file2  タブで開く
"   :help tabpage       タブのヘルプ
"   :tabe               新しいタブを開く
"   :tabe  FILE         新しいタブでファイルを開く
"   :tabf[ind] FILE     ファイルを探す 
"   :tab {cmd} "        ファイルオープン系のコマンドを指定するとタブで開く
"   ctrl-p -> ctrl-a    ctrlpで探したファイルを新しいタブで開く
"
"   gt                  次のタブ
"   gT                  前のタブ
"   :tabfir[st]         最初のタブ
"   :tabl[ast]]         最後のタブ
"
"   tabc[lose]          タブを閉じる
"
"   tabs                タブをリスト表示
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


" Store yanked strings into clibboard
" set clipboard+=unnamed

" config for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" My Plugins here:
"""
""" original repos on github
Plugin 'Shougo/neocomplete.vim'
Plugin 'thinca/vim-ref'
Plugin 'vim-scripts/sudo.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'taka84u9/vim-ref-ri'
Plugin 'ujihisa/quickrun'
Plugin 'kien/ctrlp.vim'
Plugin 'itspriddle/vim-marked'
Plugin 'vim-perl/vim-perl'
Plugin 'slim-template/vim-slim'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'Shougo/vimfiler'
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" see http://www.blog.bdauria.com/?p=431 for more details
Plugin 'tpope/vim-rails.git'
" :[EVST]view [name]                      open viewfile
" :[EVST]model [name]                     open model file
" :[EVST]controller [name]                open controller file
" :[EVST](spec|migration|helper) [name]   same
"
" :A[VST]                                 open related spec file
" gf                                      jump to resource defined file
"
" :Rails, :Rake [args]                    bin/rails and bin/rake comand
" :Rgenerate [args]                       rails g
"
" # Use this with Tmux and the Dispatch.vim
" :Rserver                                rails s
" :Rserver!                               restart rails server
" :Rserver!-                              stop rails server
"
"
" visual modelで範囲指定の後
" :Rextract <concern_name>                extract scoped code as a concern module, concern controller, or view partial

Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-bundler'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'

" Markdown preview for vim
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
set nofoldenable
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
Plugin 'rking/ag.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'

"""" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
""" non github repos
"Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()             " required
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
" END of config for Vundle
"
"
" -----------------------
"  neocomplete
" -----------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete_enable_underbar_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Disalbe vim-go's autoinstall
let g:go_disable_autoinstall = 1

" ctrp-p
" ctrl-a で new tab でファイルを開く
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<c-a>'],
  \ }
