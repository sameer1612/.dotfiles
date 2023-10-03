-- autosave file when switching buffer

return {
  setup = function()
    vim.cmd([[
    augroup AutoSaveOnBufferSwitch
      autocmd!
      autocmd BufLeave * silent! w
    augroup END
  ]])
  end,
}
