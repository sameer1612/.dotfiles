vim.g.snacks_animate = false

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dim = { enabled = true },
    indent = { enabled = true },
    quickfile = { enabled = true },
    picker = {
      enabled = true,
      layout = { preset = "vscode" },
    },
    scope = {
      enabled = true,
      keys = {
        textobject = {
          is = {
            min_size = 2,
            edge = false,
            cursor = false,
            treesitter = { blocks = { enabled = false } },
            desc = "inner scope",
          },
          as = {
            cursor = false,
            min_size = 2,
            treesitter = { blocks = { enabled = false } },
            desc = "outer scope",
          },
        },
      },
    },
  },
  keys = {
    {
      "fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "fd",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader><leader>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "fa",
      function()
        Snacks.picker.files({ hidden = true, ignored = false })
      end,
      desc = "Find all files",
    },
    {
      "fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Buffers",
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
