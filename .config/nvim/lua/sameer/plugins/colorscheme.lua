return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
