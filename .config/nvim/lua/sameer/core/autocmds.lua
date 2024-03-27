vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sagafinder" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, { pattern = "*", command = "wa", nested = true })
