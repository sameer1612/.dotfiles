return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_enable_italic = 0
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_better_performance = 1

    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox-material")
  end,
}
