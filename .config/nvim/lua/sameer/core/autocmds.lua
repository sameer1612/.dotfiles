vim.api.nvim_create_augroup("NinjaAutocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "NinjaAutocmds",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = "NinjaAutocmds",
  pattern = "*",
  command = "wa",
  nested = true,
})
