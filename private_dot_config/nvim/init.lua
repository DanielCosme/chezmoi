-- Personal
require("danicosme")
require("danicosme.set")
require("danicosme.remap")
require("danicosme.packer")
require("danicosme.auto")

-- Local configuration to share among all the servers
local lsp_defaults = {
    flags = {
        -- Amount of miliseconds neovim will wait to send the next document update notification.
        debounce_text_changes = 150,
    },
    -- The data on this option is send to the server, to announce what features the editor can support.
    capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
    -- Callback function that will be executed when a language server is attached to a buffer.
    on_attach = function(client, bufnr)
        print("Hello lsp")
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- Auto command for keybindings
vim.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

    -- LSP key bindings
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>') -- Displays hover information about the symbol under the cursor
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>') -- Jump to the definition
    -- bufmap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>') -- Jump to the definition
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>') -- Jump to declaration
    -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>') -- Lists all the implementations for the symbol under the cursor
    -- bufmap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>') -- Jumps to the definition of the type symbol
    -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>') -- Lists all the references 
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>') -- Displays a function's signature information
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>') -- Show diagnostics in a floating window
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>') -- Move to the previous diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') -- Move to the next diagnostic
    bufmap('n', '<leader>e', '<cmd>lua vim.diagnostic.setloclist()<cr>') -- Show diagnostics in a floating window
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<cr>') -- Renames all references to the symbol under the cursor


    -- Selects a code action available at the current cursor position
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    end
})

lspconfig.gopls.setup({
    -- If I want to override defaults
    -- on_attach = function(client, bufnr)
    --     lspconfig.util.default_config.on_attach(client, bufnr)
    -- end
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})


-- Lsp windows with borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

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
        {name = 'nvim_lsp', keyword_length = 3}, -- shows suggestions based on the language server response
        {name = 'buffer', keyword_length = 3}, -- suggests words found in the current buffer
        {name = 'luasnip', keyword_length = 2}, -- shows available snippets and expands them if they are chosen
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-j>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Jump to the next placeholder in the snippet.
        ['<C-n>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),
        -- Jump to the previous placeholder in the snippet.
        ['<C-p>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),
        -- Autocomplete with tab.
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, {'i', 's'}),
        -- If the completion menu is visible, move to the previous item.
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, {'i', 's'}),

    }
})

