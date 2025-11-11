require("config.lazy");
require("config.mappings");
require("config.options");

vim.cmd.colorscheme("kanagawa");

-- Override the default signature help handler
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",  -- optional: "single", "double", "shadow", etc.
    max_width = 20,      -- upper limit
    max_height = 10,     -- upper limit
  }
)
