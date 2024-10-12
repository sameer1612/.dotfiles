require("sameer.core.keymaps")
require("sameer.core.options")


if not vim.g.vscode then
  require("sameer.core.autocmds")
  require("sameer.core.filetypes")
end
