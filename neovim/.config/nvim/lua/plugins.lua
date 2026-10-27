vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})


vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

require("gitsigns").setup()
