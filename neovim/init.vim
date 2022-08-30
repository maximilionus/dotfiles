call plug#begin()

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'

call plug#end()

set number
set mouse=nv
set clipboard^=unnamed,unnamedplus
set guicursor=

colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
