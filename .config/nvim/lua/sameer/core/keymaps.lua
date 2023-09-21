local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "x", '"_x') -- disable yanking on deleting a character
keymap.set("n", "<leader>j", "J", { desc = "Join lines" })
keymap.set("n", "J", "5j", { desc = "Move 5 lines down" })
keymap.set("n", "K", "5k", { desc = "Move 5 lines up" })
keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line up" })
keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line down" })
keymap.set("v", "<M-k>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" })
keymap.set("n", "<leader>w", "<cmd> w <CR>", { desc = "Write buffer" })
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Close neovim" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Select left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Select lower split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Select upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Select right split" })
