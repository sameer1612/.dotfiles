vim.g.snacks_animate = false

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = { enabled = true },
    dim = { enabled = true },
    picker = {
      enabled = true,
      layout = { preset = "vscode" },
    },
  },
  keys = {
    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },

    {
      "ff",
      function()
        Snacks.picker.files()
      end,
      { desc = "Find Files" },
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.files()
      end,
      { desc = "Find Files" },
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.files({ hidden = true, ignored = false })
      end,
      { desc = "Find all files" },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.toggle.dim():map("<leader>td")
      end,
    })
  end,
}
