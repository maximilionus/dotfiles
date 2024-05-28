return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function () 
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                'c', 'lua', 'python', 'vim', 'vimdoc', 'bash', 'css',
                'javascript', 'html'
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
