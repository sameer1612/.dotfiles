return {
  "jackMort/tide.nvim",
  lazy = false,
  opts = {
    keys = {
      leader = ";",
      panel = ";",
      add_item = "a",
      delete = "d",
      clear_all = "x",
      horizontal = "s",
      vertical = "v",
    },
    hints = {
      dictionary = "123456789",
    },
    animation_duration = 100,
    animation_fps = 60,
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}
