set nocompatible

filetype indent plugin on

syntax on

set wildmenu
set showcmd
set hlsearch

set ignorecase
set smartcase

set autoindent

set ruler

set laststatus=2

set confirm

set visualbell

set mouse=a

set number
set relativenumber

set colorcolumn=81

inoremap fd <ESC>

au FileType markdown set tw=80

nnoremap <C-L> :nohl<CR><C-L>
