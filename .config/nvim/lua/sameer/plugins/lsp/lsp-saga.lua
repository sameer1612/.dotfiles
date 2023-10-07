return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        code_action = "󰉂",
        actionfix = "󰉂",
      },
      diagnostic = {
        extend_relatedInformation = true,
        extend_gitsigns = true,
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
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    opts.desc = "Show hover docs"
    keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts)

    opts.desc = "Show code actions"
    keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)

    opts.desc = "Show type definitions"
    keymap.set("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", opts)

    opts.desc = "Show definitions"
    keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", opts)

    opts.desc = "Show Lspsaga finder"
    keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", opts)

    opts.desc = "Go to next diagnostic information"
    keymap.set("n", "<leader>le", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  end,
}
