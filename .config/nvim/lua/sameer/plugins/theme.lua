return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.cmd("colorscheme tokyonight")

    local function disable_italics()
      for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.italic then
          local cleaned = {}
          for k, v in pairs(hl) do
            if k ~= "italic" then
              cleaned[k] = v
            end
          end
          cleaned.italic = false
          vim.api.nvim_set_hl(0, group, cleaned)
        end
      end
    end

    disable_italics()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = disable_italics,
    })
  end,
}
