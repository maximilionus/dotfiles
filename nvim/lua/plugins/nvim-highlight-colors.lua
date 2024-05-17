return {
    "brenoprata10/nvim-highlight-colors",
    opts = {
        render = "virtual",
        virtual_symbol = "●",
    },
    setup = function(PluginSpec, opts)
        require("nvim-highlight-colors").setup(args)
    end
}
