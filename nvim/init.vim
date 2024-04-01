" vim-plug init
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
call plug#end()

"" Plugins
""" vim-gitgutter transparent bg
highlight! link SignColumn LineNr


" User settings

"" Options

""" Show line numbers
set relativenumber
highlight LineNr ctermfg=darkgrey

""" Refresh time in ms
set updatetime=500

""" Allow unsaved buffers swap
set hidden

""" Case insensitive when lowercase, sensitive if any uppercase
set smartcase

""" Prefer whitespace to tabs
set expandtab smarttab
set shiftwidth=4
set tabstop=8
set softtabstop=0

""" Visual clarity for whitespaces, tabs and other symbols.
set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░


"" Keybinds

""" Remove all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

""" Unhighlight search
noremap <Leader><Space> :nohlsearch<CR>

""" Buffer Navigation
" Some actions split to Telescope
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap Q :bd!<CR>

""" Spelling check switches
nnoremap <Leader>l :set spell spelllang=en_us
nnoremap <Leader><S-l> :set nospell<CR>

""" Telescope plugin
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
