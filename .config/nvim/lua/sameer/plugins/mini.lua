return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
    require("mini.starter").setup({
      header = function()
        local hour = tonumber(os.date("%H"))
        local time_of_day = (hour < 12 and "morning") or (hour < 18 and "afternoon") or "evening"
        return "Good " .. time_of_day .. ", Sameer"
      end,
      footer = "",
    })
    require("mini.surround").setup()
  end,
}
