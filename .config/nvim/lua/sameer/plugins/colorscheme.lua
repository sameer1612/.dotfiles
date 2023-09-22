return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
  },
  config = function()
    vim.cmd("colorscheme tokyonight-night")
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
  end,
}
