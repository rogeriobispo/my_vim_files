"Initialize
set nocompatible
"set mouse=a
filetype on
filetype off

"Vundle init
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Plugins
Plugin 'thoughtbot/vim-rspec'
"Plugin 'ngmy/vim-rubocop' will use my version for testing time
Plugin 'rogeriobispo/vim-rubocop'
Plugin 'gregsexton/matchtag'
Plugin 'Rename2'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'stephpy/vim-yaml'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/emmet-vim'
Bundle 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'fatih/vim-go'
Bundle 'vim-scripts/groovy.vim'
Plugin 'danro/rename.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'm4r7inp/vim-inky'
Plugin 'simeji/winresizer'

"General
set encoding=utf-8
set relativenumber                      "add line numbers
set number
set backspace=indent,eol,start  "allow backspace in insert mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set visualbell                  "no sounds
set autoread                    "reload files changed outside vim
set copyindent
set laststatus=2
set statusline=%f
set clipboard=unnamed
set listchars=tab:▸\ ,eol:¬,trail:.,space:.
set list
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * NERDTree

"Indentation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

"Syntax
syntax on
autocmd FileType ruby     set et sw=2 ts=2 sts=2
autocmd FileType Gemfile  set ft=ruby
autocmd FileType yaml     set et sw=2 ts=2 sts=2
autocmd FileType css      set et sw=2 ts=2 sts=2
autocmd FileType python   set et sw=4 ts=4 sts=4
autocmd FileType Makefile set et sw=4 ts=4 sts=4
autocmd FileType go       set et sw=4 ts=4 sts=4
autocmd FileType sh       set et sw=4 ts=4 sts=4
autocmd FileType c        set et sw=4 ts=4 sts=4
autocmd FileType markdown set et sw=4 ts=4 sts=4
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Turn Off Swap Files
set noswapfile
set nobackup
set nowb

"Display tabs and trailing spaces visually

set nowrap       "Don't wrap lines
set wrap linebreak

"Folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"Completion
set wildmode=list:longest
set wildmenu                "on ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"Color scheme
if has('gui_running')
  set background=light
else
  set background=dark
endif

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"bindings for ragtag
inoremap <M-o>    <Esc>o
inoremap <C-j>    <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"create tabs
nmap <leader>t :tabnew<CR>

"column limit 80 chars
if exists('+colorcolumn')
  set colorcolumn=80
endif

"disable arrow keys
noremap <Up>    :echo "NOP!"<cr>
noremap <Down>  :echo "NOP!"<cr>
noremap <Left>  :echo "NOP!"<cr>
noremap <Right> :echo "NOP!"<cr>

"search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
"rvm comand rspec
"let g:rspec_command = "!rspec -fd {spec}"

" docker command change when necessary
let g:rspec_command = "!docker-compose run --rm website rspec -fd {spec}"
let g:vimrubocop_rubocop_cmd = "docker-compose run --rm --no-deps website rubocop"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"Rubocop keymap
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" NERDTree show hidden
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
  \'\.DS_Store$',
  \'\.bundle$',
  \'\.capistrano$',
  \'\.git$',
  \'\.gitkeep$',
  \'\.keep$',
  \'\.localized$',
  \'\.routes$',
  \'\.sass-cache$',
  \'\.swo$',
  \'\.swp$',
  \'tags$'
\]
