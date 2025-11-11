return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {},
    }
  },
  config = function()
    require("language-servers")
  end,
}
