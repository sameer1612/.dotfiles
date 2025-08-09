return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["_"] = { "trim_whitespace" },
      conf = { "shfmt" },
      css = { "prettierd" },
      ejs = { "prettierd" },
      graphql = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      python = { "isort", "black" },
      scss = { "prettierd" },
      sh = { "shfmt" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 10000,
    },
  },
}
