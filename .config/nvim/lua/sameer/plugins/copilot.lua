return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})

    vim.keymap.set("i", "<C-;>", function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        require("copilot.suggestion").next()
      end
    end, { desc = "Accept Copilot suggestion or go to next" })
  end,
}
