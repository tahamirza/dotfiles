call plug#begin('~/local/share/nvim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'robertmeta/nofrils'

call plug#end()

let g:nofrils_heavylinenumbers=1
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1
colorscheme nofrils-light


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
set termguicolors
