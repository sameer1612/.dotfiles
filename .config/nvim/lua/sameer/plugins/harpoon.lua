return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap

    harpoon:setup()

    keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Go to harpoon menu" })

    keymap.set("n", "<leader>hm", function()
      harpoon:list():add()
    end, { desc = "Mark file with harpoon" })

    keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Go to next harpoon mark" })

    keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Go to previous harpoon mark" })

    keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Go to first harpoon mark" })

    keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Go to second harpoon mark" })

    keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Go to third harpoon mark" })
  end,
}
