vim.api.nvim_create_user_command('LightTheme',function()
    colorscheme_set_light()
end,{})

vim.api.nvim_create_user_command('DarkTheme',function()
    colorscheme_set_dark()
end,{})

vim.api.nvim_create_user_command('SystemTheme',function()
    colorscheme_set_xdg()
end,{})
