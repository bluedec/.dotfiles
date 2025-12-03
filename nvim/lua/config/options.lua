-- Global default
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wrap = false
vim.opt.undofile = true;
vim.opt.swapfile = false;
vim.opt.scrolloff = 9;

-- Language Server Protocol options
vim.lsp.set_log_level("OFF")


