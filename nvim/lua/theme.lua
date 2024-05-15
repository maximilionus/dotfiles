local _, gnome_prefers = pcall(
    vim.fn.system,
    {'gsettings', 'get', 'org.gnome.desktop.interface', 'color-scheme'}
)

if string.find(gnome_prefers, 'default') then
    -- Light
    vim.cmd.colorscheme "catppuccin-latte"
else
    -- Dark
    -- Also used as a fallback for environments other than Gnome
    vim.cmd.colorscheme "moonfly"
end
