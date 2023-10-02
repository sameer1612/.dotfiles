return {
  "okuuva/auto-save.nvim",
  opts = {
    enabled = true,
    execution_message = {
      enabled = true,
      message = function() -- message to print on save
        return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    trigger_events = {
      immediate_save = { "BufLeave" }, -- vim events that trigger an immediate save
      defer_save = nil, -- vim events that trigger a deferred save (saves after `debounce_delay`)
      cancel_defered_save = nil, -- vim events that cancel a pending deferred save
    },
    -- function that takes the buffer handle and determines whether to save the current buffer or not
    -- return true: if buffer is ok to be saved
    -- return false: if it's not ok to be saved
    -- if set to `nil` then no specific condition is applied
    condition = nil,
    write_all_buffers = true, -- write all buffers when the current one meets `condition`
    noautocmd = false, -- do not execute autocmds when saving
    debounce_delay = 0, -- delay after which a pending save is executed
    -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
    debug = true,
  },
}
