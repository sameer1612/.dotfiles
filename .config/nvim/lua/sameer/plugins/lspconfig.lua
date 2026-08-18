return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    "saghen/blink.cmp",
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "tailwindcss" },
      },
    },
  },

  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("pyright", { capabilities = capabilities })
  end,
}
