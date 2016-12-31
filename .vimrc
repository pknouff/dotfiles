set nocompatible "Required for vundle
filetype off " Required for vundle

" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'gosukiwi/vim-atom-dark'
    Plugin 'rust-lang/rust.vim'
call vundle#end()

filetype plugin indent on " Required for vundle

set t_Co=256 " enable 256 colors
colorscheme atom-dark-256

" Status line
set statusline=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]

" Tab settings
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" show the matching part of the pair for [] {} and ()
set showmatch

" Key bindings
inoremap jj <Esc>
noremap Y y$

" Easily enable/disable paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

" Disable paste mode when leaving Insert Mode 
au InsertLeave * set nopaste

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Syntax settings
syntax on

" Python settings
au BufNewFile,BufRead *.py
    \ set autoindent
    \ textwidth=79
    \ fileformat=unix
    \ encoding=utf-8

" Treat Vagrantfile as ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

" ruby settings
au BufNewFile,BufRead *.rb, Vagrantfile
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set fileformat=unix
    \ set encoding=utf-8

" html/css/js settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Enable spell check for git commit messages
if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
endif

" split pane management
set splitright splitbelow
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <C-\> :vsplit<CR>

"ctrlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
