
set nocompatible       " Must come first because it changes other options.
filetype off           " Necessary on some Linux distros for pathogen to p



syntax enable
filetype plugin indent on " load file type plugins + indentation

set showcmd                  " Show (partial) command in status line.
set laststatus=2             " Always show the statusline
set showmatch                " Show matching brackets.

" INDENTATION
set tabstop=4 shiftwidth=4   " a tab is two spaces (or set this to 4)
set expandtab                "  use spaces, not tabs (optional)
set cindent                  " Enables automatic C program indenting.


" SEARCH 
set ignorecase               " Do case insensitive matching
set smartcase                " But case-sensitive if expression contains a capital letter.
set hlsearch                 " permet de surligner toute les correspondance d'une recherche

set mouse=a


" pour tout ce qui concerne word wrapping
set linebreak                " permet de coupé les lignes entre les mots

set number                   " show line number
set ruler                    " Show cursor position.
set cursorline               " Highlight current line

set vb t_vb=                 " beep off
set novisualbell
set noerrorbells


set background=dark
colorscheme desert

