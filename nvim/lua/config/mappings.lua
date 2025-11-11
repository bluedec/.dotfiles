
vim.g.mapleader = " ";

local n_opts = { silent = true, noremap = true, nowait = true };
local t_opts = { silent = true, nowait = true };
local v_opts = { silent = true, nowait = true };

local keymap = vim.keymap.set;

keymap("n", "<leader>q", ":q<CR>", n_opts);
keymap("n", "<leader>w", ":w<CR>", n_opts);

-- Copy to system clipboard with <leader>y
keymap("n", "<leader>y", '"+y', n_opts)
keymap("v", "<leader>y", '"+y', v_opts)

-- Terminal mode mapping
--keymap('t', '<Esc>', 'a', t_opts)
keymap('t', '<Esc>', '<C-c> exit<CR>', t_opts)

-- K tries LSP help first, only on failure of LSP help will try the NVIM help 
keymap("n", "K", vim.lsp.buf.hover, { buffer = 0 })

-- Example mapping for 'gd'
--keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

keymap("n", "tn", ":tabnew<CR>", { silent = true, desc = "Open an empty new tab" })
keymap("n", "tc", ":tabclose<CR>", { silent = true, desc = "Close the current tab" })
keymap("n", "tl", ":tabnext<CR>", { silent = true, desc = "Go to the next tab" })
keymap("n", "th", ":tabprevious<CR>", { silent = true, desc = "Go to the previous tab" })

-- rename all instances of word under caret in current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]);
