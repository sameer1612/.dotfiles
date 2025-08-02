return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      html = { "prettierd" },
      ejs = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      graphql = { "prettierd" },
      markdown = { "prettierd" },
      python = { "isort", "black" },
      ruby = { "rubocop" },
      sh = { "shfmt" },
      conf = { "shfmt" },
      ["_"] = { "trim_whitespace" },
    },

    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 10000,
    },
  },
}
