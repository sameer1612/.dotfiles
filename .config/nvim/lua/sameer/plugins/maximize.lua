return {
  "declancm/maximize.nvim",
  config = function()
    require("maximize").setup({
      default_keymaps = false,
    })

    vim.keymap.set("n", "<leader>m", "<Cmd>lua require('maximize').toggle()<CR>")
  end,
}
