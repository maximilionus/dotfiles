local detected_scheme = ''

-- GNOME DE detection
local _, gnome_prefers = pcall(vim.fn.system,
    {'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme'})

if string.find(gnome_prefers, 'default') then
    detected_scheme = 'light'
else
    detected_scheme = 'dark'
end

-- Set theme
if detected_scheme == 'light' then
    vim.o.background = 'light'
elseif detected_scheme == 'dark' then
    vim.o.background = 'dark'
end

-- Transparent elements
vim.api.nvim_set_hl(0, 'Normal', { bg=none })
vim.api.nvim_set_hl(0, 'NonText', { bg=none })
vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
