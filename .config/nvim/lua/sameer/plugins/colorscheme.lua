return {
  "sainnhe/everforest",
  lazy = false,
  config = function()
    vim.g.everforest_enable_italic = true

    vim.cmd.colorscheme("everforest")
  end,
}
