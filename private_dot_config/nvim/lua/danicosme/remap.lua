local nnoremap = require("danicosme.keymap").nnoremap
local nmap = require("danicosme.keymap").nmap

nmap(";", ":")
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>\\", ":nohlsearch<CR>")


-- Buffers
nnoremap("<leader>q", ":bd <CR>")   -- Close buffer
nnoremap("<C-J>", ":bp <CR>")       -- Previous buffer
nnoremap("<C-K>", ":bn <CR>")       -- Next buffer
--nnoremap("<leader>f", "<C-W>w")     -- Change buffer
-- nnoremap("<leader>", "")            -- 

-- TODO search by file, symbol, type/object, search all strings
-- nnoremap("<leader>s", ":<C-u>FZF<CR>") -- FZF search 
-- nnoremap("<leader>z", ":Goyo <CR>") -- Zen Mode
-- nmap("<C-n>", ":NERDTreeToggle<CR>")
