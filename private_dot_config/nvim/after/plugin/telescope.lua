local nnoremap = require("danicosme.keymap").nnoremap

nnoremap("<leader>s", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fa", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fc","<cmd>Telescope commands<cr>")

nnoremap("gr", "<cmd>Telescope lsp_references<cr>")
nnoremap("gi", "<cmd>Telescope lsp_implementations<cr>")
nnoremap("gt", "<cmd>Telescope lsp_type_definitions<cr>")
nnoremap('<C-]>', "<cmd>Telescope lsp_definitions<cr>")
