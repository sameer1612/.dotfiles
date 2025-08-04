local opt = vim.opt

opt.autoindent = true
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spell = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = vim.env.HOME .. "/.undodir"
opt.undofile = true
opt.undolevels = 100
opt.wrap = false
opt.updatetime = 250
opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.loaded_perl_provider = 0
