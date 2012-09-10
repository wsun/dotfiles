" No vi
set nocompatible

" Colors
syntax enable
filetype plugin indent on
set background=dark

" Set 7 lines to the cursor - vertical mvt j/k
set so=7

" Turn on wildmenu
set wildmenu
set wildignore+=*.o,*~,*.pyc
set wildignore+=.git,.svn.,.hg

" UI
set ruler
set title
set showcmd
set showmode
set showmatch "Brackets
set backspace=indent,start,eol

" File-specific
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "Spaces
set smarttab "Smart

set ai "Auto indent
set si "Smart indent
set wrap "Wrap
set autoindent

" Search
set nohlsearch
set incsearch "Modern
set magic "For regex
set ignorecase "Ignore case
set smartcase "Be smart
set hlsearch "Highlight

set mouse=a

nnoremap ; :
