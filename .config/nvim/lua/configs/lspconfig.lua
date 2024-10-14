require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "ts_ls", "tailwindcss", "emmet_ls", "pyright", "ruby_lsp" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.elixirls.setup {
  capabilities = nvlsp.capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  cmd = { "/Users/sameer/.elixir-ls/language_server.sh" },
  single_file_support = true,
  settings = {
    dialyzerEnabled = true,
  },
}
