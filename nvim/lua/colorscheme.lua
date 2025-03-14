function colorscheme_set_dark()
    vim.cmd.colorscheme("github_dark")
    vim.api.nvim_set_hl(0, 'Normal', { bg=none })
    vim.api.nvim_set_hl(0, 'NonText', { bg=none })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=none })
    vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
end

function colorscheme_set_light()
    vim.cmd.colorscheme("github_light")
    vim.api.nvim_set_hl(0, 'Normal', { bg=none })
    vim.api.nvim_set_hl(0, 'NonText', { bg=none })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=none })
    vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
end

colorscheme_set_dark()
