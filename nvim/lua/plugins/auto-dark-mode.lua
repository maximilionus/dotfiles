return {
    "f-person/auto-dark-mode.nvim",
    opts = {
        update_interval = 1000,
        set_dark_mode = function()
            vim.api.nvim_set_option_value("background", "dark", {})
            vim.o.background = 'dark'
            vim.api.nvim_set_hl(0, 'Normal', { bg=none })
            vim.api.nvim_set_hl(0, 'NonText', { bg=none })
            vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
        end,
        set_light_mode = function()
            vim.api.nvim_set_option_value("background", "light", {})
            vim.o.background = 'light'
            vim.api.nvim_set_hl(0, 'Normal', { bg=none })
            vim.api.nvim_set_hl(0, 'NonText', { bg=none })
            vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
        end,
    },
}
