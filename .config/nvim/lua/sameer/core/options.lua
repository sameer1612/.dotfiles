local opt = vim.opt

opt.autoindent = true
opt.clipboard:append("unnamedplus")
opt.cursorline = true
opt.expandtab = true
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.ignorecase = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = vim.env.HOME .. "/.undodir"
opt.undofile = true
opt.undolevels = 100
opt.updatetime = 250
opt.wrap = false

vim.g.loaded_perl_provider = 0
