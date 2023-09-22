return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                               ....                                         ",
      "                            ,;;'''';;,                    ,;;;;,            ",
      "                  ,        ;;'      `;;,               .,;;;'   ;           ",
      "               ,;;;       ;;          `;;,';;;,.     ,%;;'     '            ",
      "             ,;;,;;       ;;         ,;`;;;, `;::.  %%;'                    ",
      "            ;;;,;;;       `'       ,;;; ;;,;;, `::,%%;'                     ",
      "            ;;;,;;;,          .,%%%%%'% ;;;;,;;   %;;;                      ",
      "  ,%,.      `;;;,;;;,    .,%%%%%%%%%'%; ;;;;;,;;  %;;;                      ",
      " ;,`%%%%%%%%%%`;;,;;'%%%%%%%%%%%%%'%%'  `;;;;;,;, %;;;                      ",
      " ;;;,`%%%%%%%%%%%,; ..`%%%%%%%%;'%%%'    `;;;;,;; %%;;                      ",
      "  `;;;;;,`%%%%%,;;/, .. `''''',%%%%%      `;;;;;; %%;;,                     ",
      "     `;;;;;;;,;;/////,.    ,;%%%%%%%        `;;;;,`%%;;                     ",
      "            ;;;/%%%%,%///;;;';%%%%%%,          `;;;%%;;,                    ",
      "           ;;;/%%%,%%%%%/;;;';;'%%%%%,             `%%;;                    ",
      "          .;;/%%,%%%%%//;;'  ;;;'%%%%%,             %%;;,                   ",
      "          ;;//%,%%%%//;;;'   `;;;;'%%%%             `%;;;                   ",
      "          ;;//%,%//;;;;'      `;;;;'%%%              %;;;,                  ",
      "          `;;//,/;;;'          `;;;'%%'              `%;;;                  ",
      "            `;;;;'               `;'%'                `;;;;                 ",
      "                                   '      .,,,.        `;;;;                ",
      "                                       ,;;;;;;;;;;,     `;;;;               ",
      "                                      ;;;'    ;;;,;;,    `;;;;              ",
      "                                      ;;;      ;;;;,;;.   `;;;;             ",
      "                                       `;;      ;;;;;,;;   ;;;;             ",
      "                                         `'      `;;;;,;;  ;;;;             ",
      "                                                    `;;,;, ;;;;             ",
      "                                                       ;;, ;;;;             ",
      "                                                         ';;;;;             ",
      "                                                          ;;;;;             ",
      "                                                         .;;;;'             ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > File explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fr", "  > Find Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("q", "  > Quit", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
