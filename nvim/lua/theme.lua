local gnome_prefers = vim.fn.system {'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme'}

if string.find(gnome_prefers, 'default') then
    -- Light
    vim.cmd.colorscheme "catppuccin-latte"
else
    -- Dark
    vim.cmd.colorscheme "moonfly"
end
