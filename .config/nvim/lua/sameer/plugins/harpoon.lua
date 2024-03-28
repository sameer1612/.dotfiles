return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>hh",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Go to harpoon menu" }
    )
    keymap.set(
      "n",
      "<leader>hm",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>1",
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      { desc = "Go to first harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>2",
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      { desc = "Go to second harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>3",
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      { desc = "Go to third harpoon mark" }
    )
  end,
}
