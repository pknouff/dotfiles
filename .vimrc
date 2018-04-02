set nocompatible "Required for vundle
filetype off " Required for vundle

" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'gosukiwi/vim-atom-dark'

    " optionally load additional plugins from ~/.vimrc.plugins
    if filereadable($HOME . "/.vimrc.plugins")
      source ~/.vimrc.plugins
    endif

call vundle#end()

filetype plugin indent on " Required for vundle

set t_Co=256 " enable 256 colors
colorscheme atom-dark-256

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set relativenumber

" Tab settings
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Key bindings
inoremap jj <Esc>

" Disable paste mode when leaving Insert Mode 
au InsertLeave * set nopaste

" Syntax settings
syntax on

" Python settings
au BufNewFile,BufRead *.py
    \ set autoindent
    \ textwidth=79
    \ fileformat=unix
    \ encoding=utf-8

" yml settings
au BufNewFile,BufRead *.yml
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ fileformat=unix
    \ encoding=utf-8

" Treat Vagrantfile as ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

" ruby settings
au BufNewFile,BufRead *.rb
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ fileformat=unix
    \ encoding=utf-8

" Enable spell check for git commit messages
if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
endif

" optionally load additional settings from ~/.vimrc.local
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
