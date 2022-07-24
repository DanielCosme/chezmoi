-- Autocmd
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
   group = augroup,
   pattern = 'ruby',
   desc = 'ruby indentation',
   command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab'
})


