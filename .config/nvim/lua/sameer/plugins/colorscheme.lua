return {
  "oahlen/iceberg.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("iceberg")
    vim.cmd("highlight clear LineNr")
    vim.cmd("highlight clear SignColumn")
    vim.cmd("highlight LineNr guifg=#454D73")
  end,
}
