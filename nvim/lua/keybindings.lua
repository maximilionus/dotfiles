-- Unhighlight search
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Buffer Navigation
--- Some actions split to Telescope
vim.keymap.set('n', '<leader>n', ':bnext<CR>')
vim.keymap.set('n', '<leader>p', ':bprev<CR>')
vim.keymap.set('n', 'Q', ':bd!<CR>')

-- Spelling check switches
vim.keymap.set('n', '<leader>l', ':set spell spelllang=en_us,ru_ru')
vim.keymap.set('n', '<leader><S-l>', ':set nospell<CR>')
