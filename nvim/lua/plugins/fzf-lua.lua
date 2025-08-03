return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>pf", ":FzfLua files<CR>");
    vim.keymap.set("n", "<leader>pg", ":FzfLua resume<CR>");
  end,
}
