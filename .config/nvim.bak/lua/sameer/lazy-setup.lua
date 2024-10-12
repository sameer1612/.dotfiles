local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { import = "sameer.vsc-shared-plugins" },
}

if not vim.g.vscode then
  table.insert(plugins, { import = "sameer.plugins" })
  table.insert(plugins, { import = "sameer.plugins.lsp" })
end

require("lazy").setup(plugins, {
  install = { colorscheme = { "gruvbox" } },
  change_detection = { notify = false },
})
