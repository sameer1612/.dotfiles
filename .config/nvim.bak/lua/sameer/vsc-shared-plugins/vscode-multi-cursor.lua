vim.keymap.set("n", "mm", "mciw*<Cmd>nohl<CR>", { remap = true })

return {
  'vscode-neovim/vscode-multi-cursor.nvim',
  event = 'VeryLazy',
  cond = not not vim.g.vscode,
  opts = {},
}
