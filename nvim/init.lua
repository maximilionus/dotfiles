-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup("plugins")

-- Theme
vim.cmd.colorscheme "catppuccin"

-- Enable relative numbers
vim.opt.relativenumber = true

-- Allow unsaved buffers switch
vim.opt.hidden = true

-- Prefer spaces to tabs
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.softtabstop = 0

-- Show whitespace, tabs
vim.opt.list = true

-- Keybindings
-- Unhighlight search
vim.keymap.set('n', '<Leader><Space>', ':nohlsearch<CR>')

-- Buffer Navigation
--- Some actions split to Telescope
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set('n', 'Q', ':bd!<CR>')

-- Spelling check switches
vim.keymap.set('n', '<Leader>l', ':set spell spelllang=en_us')
vim.keymap.set('n', '<Leader><S-l>', ':set nospell<CR>')

-- Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
