return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.align').setup()      -- Align text with 'ga'
        require('mini.comment').setup()    -- Comment code with 'gc'
        require('mini.completion').setup() -- Completion auto popup
        require('mini.statusline').setup() -- Minimal status line
        require('mini.trailspace').setup() -- Trail whitespace (Used in keybindings)
    end,
}
