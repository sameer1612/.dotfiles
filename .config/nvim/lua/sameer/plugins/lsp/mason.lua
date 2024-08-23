return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "graphql",
        "ruby_lsp",
        "angularls",
        "tailwindcss",
        "elixirls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "isort",
        "black",
        "eslint_d",
        "rubocop",
        "ruff",
        "biome",
      },

      automatic_installation = true,
    })
  end,
}
