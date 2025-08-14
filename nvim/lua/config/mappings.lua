
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

