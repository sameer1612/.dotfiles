return {
  "declancm/maximize.nvim",
  config = function()
    vim.keymap.set("n", "<leader>m", "<Cmd>lua require('maximize').toggle()<CR>")
  end,
}
