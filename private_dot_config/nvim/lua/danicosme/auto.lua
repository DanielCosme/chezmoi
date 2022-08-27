-- Autocmd
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
   group = augroup,
   pattern = 'ruby',
   desc = 'ruby indentation',
   command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab'
})

vim.api.nvim_create_autocmd('FileType', {
   group = augroup,
   pattern = 'rust',
   desc = 'rust color scheme',
   command = 'colorscheme gruvbox'
})
