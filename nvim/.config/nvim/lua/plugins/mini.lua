return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.align').setup()      -- Align text with 'ga'
        require('mini.comment').setup()    -- Comment code with 'gc'
        require('mini.trailspace').setup() -- Trail whitespace cleanup
    end,
}
