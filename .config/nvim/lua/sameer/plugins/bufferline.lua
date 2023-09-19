return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      separator_style = "slope",
      themable = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true
        }
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      }
    },
  },
}
