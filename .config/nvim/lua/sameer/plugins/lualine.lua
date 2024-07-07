local function maximize_status()
  return vim.t.maximized and "   " or ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "iceberg",
      },
      sections = {
        lualine_c = { { "filename", path = 1 }, { maximize_status } },
        lualine_x = {
          { "filetype" },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
          },
        },
      },
    })
  end,
}
