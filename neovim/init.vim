call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

set number
set mouse=nv
set clipboard^=unnamed,unnamedplus
set guicursor=

autocmd vimenter * ++nested colorscheme gruvbox
