-- Snippet Engine Configuration
require('luasnip.loaders.from_vscode').lazy_load()
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        {name = 'path'}, -- autocomplete paths
        {name = 'nvim_lsp', keyword_length = 1}, -- shows suggestions based on the language server response
        {name = 'buffer', keyword_length = 3}, -- suggests words found in the current buffer
        {name = 'luasnip', keyword_length = 2}, -- shows available snippets and expands them if they are chosen
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        window = {
            completion = {
                  winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
              col_offset = -3,
              side_padding = 2,
            },
        },
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)
             local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
             local strings = vim.split(kind.kind, "%s", { trimempty = true })
             kind.kind = " " .. strings[1] .. " "
             kind.menu = "    (" .. strings[2] .. ")"
            
             return kind
        end
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-j>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if not cmp.get_selected_entry() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                cmp.confirm()
            else 
                cmp.confirm()
            end
          else
            fallback()
          end
        end, {'i', 's', 'c'}),
        -- If the completion menu is visible, move to the previous item.
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if not cmp.get_selected_entry() then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                cmp.confirm()
            else 
                cmp.confirm()
            end
          else
            fallback()
          end
        end, {'i', 's', 'c'}),
    }
})

-- To insert `(` after select function or method item on nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})
