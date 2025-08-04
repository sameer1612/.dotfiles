return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
  end,
}
