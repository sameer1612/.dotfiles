return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter = require "nvim-treesitter.configs"

      treesitter.setup {
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = { enable = false },
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "python",
          "graphql",
          "regex",
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        auto_install = true,
      }
    end,
  },
}
