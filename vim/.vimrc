call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-dirvish'

Plug 'lifepillar/vim-mucomplete'

Plug 'w0rp/ale'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'christoomey/vim-tmux-navigator'

Plug 'lyuts/vim-rtags'

call plug#end()

" completion
set completeopt+=menuone,noselect,noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {'vim': ['path', 'cmd', 'keyn'], 'default': ['path', 'omni', 'keyn', 'dict', 'uspl']}
let g:mucomplete#chains.cpp = ['tags', 'ulti', 'incl']
let g:mucomplete#chains.c = ['tags', 'ulti', 'incl']

" ale
let g:ale_sign_column_always = 1

" general
set number
set relativenumber

set exrc
set secure
