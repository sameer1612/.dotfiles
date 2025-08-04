return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-media-files.nvim",
    "tpope/vim-obsession",
    "dhruvasagar/vim-prosession",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        path_display = { "truncate " },
        file_ignore_patterns = { "node_modules", "__pycache__" },
        layout_config = {
          width = 0.75,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {},
    })

    telescope.load_extension("fzf")
    telescope.load_extension("media_files")
    telescope.load_extension("prosession")

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
    keymap.set(
      "n",
      "<leader>fa",
      "<cmd>Telescope find_files hidden=true<cr>",
      { desc = "Find files including hidden files" }
    )
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in the file" })
    keymap.set("n", "<leader>fp", "<cmd>Telescope prosession<cr>", { desc = "Find sessions" })
  end,
}
