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
    backdrop = 1,
    width = 120,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  }
  -- callback where you can add custom code when the Zen window opens
  -- on_open = function(win)
  -- end,
  -- -- callback where you can add custom code when the Zen window closes
  -- on_close = function()
  -- end,
}

vim.keymap.set('n', '<leader>z', ":ZenMode <CR>", { desc = 'Enter Zen mode' })

vim.g.everforest_background = 'hard'
