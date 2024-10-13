return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "gbprod/substitute.nvim",
    lazy = false,
    config = function()
      vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enable_close_on_slash = true,
    },
  },
  {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
    },
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = true,
  },
}
