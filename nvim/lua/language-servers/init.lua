
-- servers that need additional configuration
local servers = {
  "lua_ls",
  "html",
  "ts_ls",
  "emmet_language_server",
  --"pylyzer", pretty poor experience
}


-- simple 
vim.lsp.enable('basedpyright');
vim.lsp.enable('ruff');
vim.lsp.enable('somesass_ls')
vim.lsp.enable('cssls')
vim.lsp.enable('csharp_ls')
vim.lsp.enable('zls');
vim.lsp.enable('pyright');
vim.lsp.enable('htmx')
vim.lsp.enable('jinja_lsp')

vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

for _, server in ipairs(servers) do
  require("language-servers." .. server)
end
