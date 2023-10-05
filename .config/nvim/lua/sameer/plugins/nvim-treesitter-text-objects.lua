return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

            ["a:"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/field region" },
            ["i:"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/field region" },

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },

            ["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" },
            ["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" },

            ["am"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            ["im"] = { query = "@function.inner", desc = "Select inner part of a function region" },

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
          include_surrounding_whitespace = false,
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
          goto_next = {
            ["]i"] = "@conditional.inner",
          },
          goto_previous = {
            ["[i"] = "@conditional.inner",
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
          },
          swap_previous = {
            ["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
          },
        },
      },
    })

    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
  end,
}
