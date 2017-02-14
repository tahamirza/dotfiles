call plug#begin('~/local/share/nvim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()


autocmd! BufWritePost * Neomake
let g:deoplete#enable_at_startup = 1

inoremap fd <ESC>

set showcmd
set ignorecase
set smartcase
set ruler
set confirm
set number
set relativenumber
set colorcolumn=81
set showmatch
