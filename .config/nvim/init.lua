require('config')
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  change_detection = {
    enable = true,
    notify = true,
  }
});

vim.lsp.enable({
  "luals",
  "hls",
  "py",
  "tailwind",
  "tls",
  "clangd",
  "nix",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      -- Nothing else needed for completion.
    end
  end,
})
-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
