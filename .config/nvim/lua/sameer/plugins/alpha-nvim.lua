return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

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
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > File explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fr", "  > Find Recent", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("q", "  > Quit", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
