return {
  {
    "github/copilot.vim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "gbprod/substitute.nvim",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = true,
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
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = true,
  },
  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    opts = {
      quiet_mode = true,
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "ts_ls",
        "tailwindcss",
        "emmet_ls",
        "pyright",
        "solargraph",
        "elixirls",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
