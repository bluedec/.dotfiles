return {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  root_markers = {
    'stack.yaml',
    'cabal.project',
    'package.yaml',
    'hie.yaml',
    '.git',
    '*.cabal' -- This allows single-package Cabal projects to be recognized 
  },
}
