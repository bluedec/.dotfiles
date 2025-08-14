
return { -- optional cmp completion source for require statements and module annotations
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, {
      name = "lazydev",
      group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    })
  end,

  config = function()
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping.confirm{
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-h>'] = cmp.mapping.abort(),
        --['<C-Space>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        --{ name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })
  end,
}
