-- Disable netrw to avoid race conditions with nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<C-n>', ":NvimTreeToggle<CR>")
vim.keymap.set('n', "<leader>gn", ":NvimTreeFindFile<CR>")
