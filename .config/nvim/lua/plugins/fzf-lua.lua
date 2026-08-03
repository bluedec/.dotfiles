return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  --dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    local ignore_file = vim.fn.stdpath('config') .. '/.fzf-ignore'
    require('fzf-lua').setup({
      file_ignore_patterns = { "node_modules/.*" },
      files = {
        formatter = "path.filename_first"
      },
      grep = {
        formatter = "path.filename_first"
      },
      live_grep = {
        formatter = "path.filename_first"
      },
      winopts = {
        backdrop = 15,
        preview = {
          delay = 30
        },
      },
      defaults = {
        file_icons = "mini",
      },
    })
    vim.keymap.set("n", "<leader>pf", ":FzfLua files<CR>");
    vim.keymap.set("n", "<leader>pg", ":FzfLua resume<CR>");
    vim.keymap.set("n", "<leader>gp", ":FzfLua grep_project<CR>");
  end,
}
