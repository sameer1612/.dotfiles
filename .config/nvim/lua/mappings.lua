require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

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
