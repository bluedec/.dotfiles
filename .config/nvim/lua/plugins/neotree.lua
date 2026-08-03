return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- keymaps
    vim.keymap.set("n", "<leader>e", ":Neotree<CR>");

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "focus" })
          end,
        }
      },
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },			window = {
          mappings = {
            -- Optional: If you want to disable Enter from opening files,
            -- map it to 'noop' (no operation)
            ["<CR>"] = "noop",
            -- Map Tab to the 'open' action
            ["<Tab>"] = "open",
          },
        },
      } 
    });
  end,
  lazy = false, -- neo-tree will lazily load itself
}
