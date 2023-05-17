-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.hlsearch = true -- Set highlight on search
vim.opt.incsearch = true

vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.filetype = "on"

vim.opt.expandtab = true -- insert spaces when tab is pressed
vim.opt.tabstop = 4 -- number of spaces inserted when tab key pressed
vim.opt.softtabstop = 4 -- number of spaces inserted when tab key pressed
vim.opt.shiftwidth = 4 -- number of spaces inserted by < & > indent motions

vim.opt.autoread = true -- detect changes when  other programs read the file and reaload

vim.opt.autowrite = true

vim.opt.smartindent = true -- try to indent

vim.opt.lazyredraw = true -- redraw only when we need to.

vim.opt.scrolloff = 8 -- show lines above and below cursor (when possible).

vim.opt.sidescrolloff= 8

vim.opt.hidden = true -- allow buffer to be hiden if modified.

vim.opt.splitright = true

vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

vim.opt.swapfile = false

vim.opt.backup = false

vim.opt.signcolumn = "auto:2"

vim.opt.shell = "sh"

vim.opt.wrap = false

vim.opt.showtabline = 1 -- showtabline if there are more 2 or more tabs

-- vim.opt.colorcolumn = "100"

vim.opt.fileencoding = "utf-8"
