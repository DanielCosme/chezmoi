local nmap = require("danicosme.keymap").nmap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

nmap("<C-n>", ":NvimTreeToggle<CR>")
nmap("<leader>gn", ":NvimTreeFindFile<CR>")
