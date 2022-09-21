local nnoremap = require("danicosme.keymap").nnoremap

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fa", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fc","<cmd>Telescope commands<cr>")
nnoremap("<leader>fs","<cmd>Telescope lsp_workspace_symbols<cr>")

nnoremap("gr", "<cmd>Telescope lsp_references<cr>")
nnoremap("gi", "<cmd>Telescope lsp_implementations<cr>")
nnoremap("gt", "<cmd>Telescope lsp_type_definitions<cr>")
nnoremap('<C-]>', "<cmd>Telescope lsp_definitions<cr>")

require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}
