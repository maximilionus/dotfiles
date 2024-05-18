local selected_scheme = 'dark'

-- Default detection
if vim.o.background == 'light' then
    selected_scheme = vim.o.background
end

-- GNOME DE detection
local _, gnome_prefers = pcall(vim.fn.system,
    {'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme'})
if string.find(gnome_prefers, 'default') then
    selected_scheme = 'light'
end

-- Set theme
if selected_scheme == 'light' then
    vim.cmd.colorscheme 'catppuccin-latte'
else
    vim.cmd.colorscheme 'catppuccin-macchiato'
end

-- Transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg=none })
vim.api.nvim_set_hl(0, 'NonText', { bg=none })
