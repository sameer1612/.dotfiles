return {
  "0x00-ketsu/autosave.nvim",
  event = { "BufReadPost" },
  opts = {
    events = { "FocusLost", "BufLeave" },
  },
}
