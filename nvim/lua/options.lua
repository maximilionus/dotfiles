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
vim.opt.listchars = {
    trail = '·',
    tab = '> ',
    nbsp = '␣'
}
