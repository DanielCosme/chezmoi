-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.keymap.set("n", ";", ":", {noremap = false})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- For rapid netrrw access.

vim.keymap.set("n", "<leader>\\", ":nohlsearch<CR>") -- Clear word highlight

-- Buffers
vim.keymap.set("n", "<C-J>", ":bp <CR>")       -- Previous buffer

vim.keymap.set("n", "<C-K>", ":bn <CR>")       -- Next buffer

vim.keymap.set("n", "<leader>q", ":bd <CR>")   -- Close buffer

vim.keymap.set("n", "<leader>h", "<C-w>h")  -- Buffer to the left

vim.keymap.set("n", "<leader>j", "<C-w>j")  -- Buffer down

vim.keymap.set("n", "<leader>k", "<C-w>k")  -- Buffer up

vim.keymap.set("n", "<leader>l", "<C-w>l")  -- Next buffer

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- err != nil snippet for Go.
vim.keymap.set(
  'n',
  '<leader>n',
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
