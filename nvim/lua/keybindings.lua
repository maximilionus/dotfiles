-- Unhighlight search
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Buffer Navigation
--- Some actions split to Telescope
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set('n', 'Q', ':bd!<CR>')

-- Spelling check switches
vim.keymap.set('n', '<leader>l', ':set spell spelllang=en_us')
vim.keymap.set('n', '<leader><S-l>', ':set nospell<CR>')

-- Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- Make the normie suffer, enforce HJKL 😈
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
