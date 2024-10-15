require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del
local opts = { noremap = true, silent = true }

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", "0", "^", { desc = "Goto first non empty character in line" })
map("n", "<C-h>", "<C-w>h", { desc = "Select left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Select lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Select upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Select right split" })
map("n", "<M-down>", ":m .+1<CR>==", { desc = "Move line up" })
map("n", "<M-o>", "o<ESC>", { desc = "Insert a new line down in normal mode" })
map("n", "<M-up>", ":m .-2<CR>==", { desc = "Move line down" })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "<leader>j", "J", { desc = "Join lines" })
map("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Close neovim" })
map("n", "<leader>w", "<cmd> w <CR>", { desc = "Write buffer" })
map("n", "J", "5j", { desc = "Move 5 lines down" })
map("n", "K", "5k", { desc = "Move 5 lines up" })
map("v", "J", "5j", { desc = "Move 5 lines down" })
map("v", "K", "5k", { desc = "Move 5 lines up" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" })
map("v", "<M-k>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
map("v", "p", "P", { desc = "Paste without yanking" })
map("n", "<leader>bd", "<cmd> %bd<CR>", { desc = "Close all buffers" })

-- Telescope mappings
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in the file" })
map("n", "<leader>fp", "<cmd>Telescope prosession<cr>", { desc = "Find sessions" })

-- Lsp mappings
map("n", "<leader>rs", ":LspRestart<CR>", opts)
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "<leader>lr", vim.lsp.buf.rename, opts)

-- substitute mappings
map("n", "s", require("substitute").operator, { noremap = true })

-- lspconfig mappings
map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
map("n", "<leader>lr", vim.lsp.buf.rename, opts)
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
map("n", "<leader>rs", ":LspRestart<CR>", opts)

-- lspsaga mappings
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
map("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", opts)
map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", opts)
map("n", "<leader>le", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- nvim-tree mappings
map("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- remove default mappings
nomap("n", "<leader>n")
nomap("n", "<leader>b")
