return {
  cmd = { "tailwindcss-language-server", "--stdio" },

  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },

  root_markers = {
    ".git",
    "package.json",
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.ts",
  },
}
