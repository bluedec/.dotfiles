
vim.g.mapleader = " ";

vim.keymap.set("n", "<leader>q", ":q<CR>");
vim.keymap.set("n", "<leader>w", ":w<CR>");

-- Copy to system clipboard with <leader>y
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

