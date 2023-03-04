require('daniel')

vim.diagnostic.config {
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
}

require("zen-mode").setup {
  window = {
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  },
}

vim.keymap.set('n', '<leader>z', ":ZenMode <CR>", { desc = '[F]ind [F]iles' })
