return {
  "Yazeed1s/oh-lucy.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    -- vim.g.gruvbox_material_better_performance = 1
    -- vim.g.gruvbox_material_background = "hard"
    vim.cmd.colorscheme("oh-lucy")
  end,
}
