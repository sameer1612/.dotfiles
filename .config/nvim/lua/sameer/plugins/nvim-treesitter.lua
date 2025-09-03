return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "bash",
        "markdown",
        "markdown_inline",
        "regex",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "scss",
        "ruby",
        "yaml",
        "python",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
