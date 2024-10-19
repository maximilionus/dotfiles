return {
    "f-person/auto-dark-mode.nvim",
    opts = {
        update_interval = 1000,
        set_dark_mode = function()
            --vim.opt.background = 'dark'
            vim.cmd.colorscheme("xcodedark")
            vim.api.nvim_set_hl(0, 'Normal', { bg=none })
            vim.api.nvim_set_hl(0, 'NonText', { bg=none })
            vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=none })
            vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
        end,
        set_light_mode = function()
            --vim.opt.background = 'light'
            vim.cmd.colorscheme("xcodelight")
            vim.api.nvim_set_hl(0, 'Normal', { bg=none })
            vim.api.nvim_set_hl(0, 'NonText', { bg=none })
            vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=none })
            vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
        end,
    },
}
