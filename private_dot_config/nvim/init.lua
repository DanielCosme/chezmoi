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
        print("hello lsp")
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
    bufmap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>') -- Jump to the definition
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>') -- Jump to declaration
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>') -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>') -- Jumps to the definition of the type symbol
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>') -- Lists all the references 
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>') -- Displays a function's signature information
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>') -- Show diagnostics in a floating window
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>') -- Move to the previous diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') -- Move to the next diagnostic
    bufmap('n', '<leader>e', '<cmd>lua vim.diagnostic.setloclist()<cr>') -- Show diagnostics in a floating window
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>') -- Renames all references to the symbol under the cursor


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

