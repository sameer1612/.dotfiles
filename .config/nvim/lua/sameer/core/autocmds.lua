vim.api.nvim_create_autocmd({ "BufLeave" }, { pattern = "*", command = "wa", nested = true })
