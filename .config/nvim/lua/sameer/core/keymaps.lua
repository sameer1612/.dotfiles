local keymap = vim.keymap 

vim.g.mapleader = " "

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "x", '"_x') -- disable yanking on deleting a character
keymap.set("n", "J", "5j", { desc = "Move 5 lines down" })
keymap.set("n", "K", "5k", { desc = "Move 5 lines up" })
keymap.set("n", "<leader>w", "<cmd> w <CR>", { desc = "Write buffer" })
keymap.set("n", "<leader>q", "<cmd> q <CR>", { desc = "Quit buffer" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) 
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) 
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) 
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) 

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) 
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) 

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Select left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Select lower split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Select upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Select right split" })
