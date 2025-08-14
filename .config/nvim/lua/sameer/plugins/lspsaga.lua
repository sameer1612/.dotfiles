return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("lspsaga").setup({
      definition = {
        keys = {
          edit = "e",
        },
      },
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
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
    keymap.set("n", "gre", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  end,
}
