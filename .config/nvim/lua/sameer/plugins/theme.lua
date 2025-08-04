return {
  "neanias/everforest-nvim",
  config = function()
    require("everforest").setup()
    vim.cmd("colorscheme everforest")
  end,
}
