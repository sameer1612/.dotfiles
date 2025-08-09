return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "ts_ls", "pyright" },
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

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("pyright")

    -- running rubocop in lsp mode for better performance
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ruby",
      callback = function()
        vim.lsp.start({
          name = "rubocop",
          cmd = { "rubocop", "--lsp" },
        })
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rb",
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "ld", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "lh", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "lr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "lre", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "la", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}
