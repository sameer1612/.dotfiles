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
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "ruby_lsp", "tailwindcss" },
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
    vim.lsp.config("ruby_lsp", { capabilities = capabilities })

    -- running rubocop in lsp mode for better performance
    vim.api.nvim_create_autocmd("BufReadPre", {
      pattern = "ruby",
      callback = function()
        vim.lsp.start({
          name = "rubocop",
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
        })
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rb",
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
