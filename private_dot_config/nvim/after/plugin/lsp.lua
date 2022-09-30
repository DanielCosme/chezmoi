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
        print("Lsp attached")
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

-- LSP language servers config
-- Go
lspconfig.gopls.setup{
    -- If I want to override defaults
    -- on_attach = function(client, bufnr)
    --     lspconfig.util.default_config.on_attach(client, bufnr)
    -- end
}
-- JS && TS
lspconfig.tsserver.setup{}
-- Rust
lspconfig.rls.setup{}
-- Ruby
lspconfig.solargraph.setup{}

-- Diagnostics
vim.diagnostic.config{
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}


-- Lsp windows with borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

-- Trouble
require("trouble").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
