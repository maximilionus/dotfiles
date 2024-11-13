vim.api.nvim_create_user_command('TrimTrailWhitespace',function()
    MiniTrailspace.trim()
end,{})
