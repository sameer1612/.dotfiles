return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      separator_style = "slope",
      numbers = "ordinal",
      show_close_icon = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Nvim Tree",
          text_align = "left",
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
