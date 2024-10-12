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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
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
