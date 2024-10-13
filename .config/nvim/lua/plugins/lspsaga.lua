return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
  config = function()
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    require("lspsaga").setup {
      ui = {
        code_action = "󰉂",
        actionfix = "󰉂",
      },
      diagnostic = {
        extend_relatedInformation = true,
        extend_gitsigns = true,
        show_source = true,
      },
      symbol_in_winbar = {
        enable = false,
      },
      finder = {
        keys = {
          vsplit = "v",
        },
      },
      lightbulb = {
        virtual_text = false,
      },
      code_action = {
        only_in_cursor = false,
      },
    }

    opts.desc = "Show hover docs"
    map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts)

    opts.desc = "Show code actions"
    map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)

    opts.desc = "Show type definitions"
    map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", opts)

    opts.desc = "Show definitions"
    map("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", opts)

    opts.desc = "Show Lspsaga finder"
    map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", opts)

    opts.desc = "Go to next diagnostic information"
    map("n", "<leader>le", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  end,
}
