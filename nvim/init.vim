" vim-plug init
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
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
nnoremap <Leader>n :enew<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <Leader>3 :b#<CR>
nnoremap <Leader>a :only<CR>
nnoremap <Leader>b :ls<CR>
nnoremap Q :bd!<CR>

""" Spelling check switches
nnoremap <Leader>l :set spell spelllang=en_us
nnoremap <Leader><S-l> :set nospell<CR>
