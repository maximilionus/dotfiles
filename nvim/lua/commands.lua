vim.api.nvim_create_user_command('TrimTrailWhitespace',function()
    MiniTrailspace.trim()
end,{})

vim.api.nvim_create_user_command('LightMode',function()
    colorscheme_set_light()
end,{})

vim.api.nvim_create_user_command('DarkMode',function()
    colorscheme_set_dark()
end,{})
