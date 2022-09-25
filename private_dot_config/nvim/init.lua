-- Personal
require("danicosme")
require("danicosme.set")
require("danicosme.remap")
require("danicosme.packer")
require("danicosme.auto")

--[[
TODO: Neovim configurations
- Telescope configure to my liking
- Treesitter configure properly
- Gitsigns configure properly
- nvim-cmp (autocomplete engine), configure better
- nvim-tree, configure properly
- nvim-autopairs, configure properly
- luasnip, configure properly

- which-key, install and configure
- bufferline, install and configure
- comment, install and configure


- lua-dev --> later on when I want to understand neovim better
--]]

-- Mappings
local nnoremap = require("keymap").nnoremap
local nmap = require("keymap").nmap
-- Nerd Tree
nmap("<C-n>", ":NvimTreeToggle<CR>")
nmap("<leader>gn", ":NvimTreeFindFile<CR>")
-- Telescope
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fa", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fs","<cmd>Telescope lsp_workspace_symbols query=.<cr>")
nnoremap("<leader>cc","<cmd>Telescope commands<cr>")
nnoremap("gr", "<cmd>Telescope lsp_references<cr>")
nnoremap("gi", "<cmd>Telescope lsp_implementations<cr>")
nnoremap("gt", "<cmd>Telescope lsp_type_definitions<cr>")
nnoremap('<C-]>', "<cmd>Telescope lsp_definitions<cr>")

-----  Language Server Protocol Keybindings ----
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
    -- bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>') -- Displays a function's signature information
    bufmap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>') -- Show diagnostics in a floating window
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>') -- Move to the previous diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') -- Move to the next diagnostic
    bufmap('n', '<leader>ge', '<cmd>lua vim.diagnostic.setloclist()<cr>') -- Show diagnostics list in a buffer?
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>') -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<cr>') -- Renames all references to the symbol under the cursor


    -- Selects a code action available at the current cursor position
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    end
})
