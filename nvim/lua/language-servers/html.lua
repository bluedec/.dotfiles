
return {
  vim.lsp.enable('html');
  vim.lsp.config('html', {
    filetypes = { "html", "templ", "typescriptreact", "javascriptreact" },
  })
}
