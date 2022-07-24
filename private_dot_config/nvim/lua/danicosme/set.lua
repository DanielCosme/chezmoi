local set = vim.opt -- global, window and buffer settings
local let = vim.g

-- Variables
let.mapleader = " " -- set space as leader

-- Options
set.filetype = "on"
set.clipboard = "unnamedplus" -- for x11
-- set.clipboard=unnamed " for win 10
set.expandtab = true -- insert spaces when tab is pressed
set.tabstop = 4 -- number of spaces inserted when tab key pressed
set.softtabstop = 4 -- number of spaces inserted when tab key pressed
set.shiftwidth = 4 -- number of spaces inserted by < & > indent motions
set.autoread = true-- detect changes when  other programs read the file and reaload
set.smartindent = true -- try to indent
set.number = true
set.relativenumber = false
set.incsearch = true
set.cursorline = true -- highlight current line

set.lazyredraw = true -- redraw only when we need to.
set.scrolloff = 8 -- show lines above and below cursor (when possible).
set.sidescrolloff=8
set.timeout = true -- fix slow O inserts.
set.timeoutlen = 1000 -- fix slow O inserts.
set.ttimeoutlen = 100 -- fix slow O inserts.
set.hidden = true -- allow buffer to be hiden if modified.
set.splitright = true
set.swapfile = false
set.backup = false
-- undo persist
set.undodir = "~/.vim/undodir"
set.undofile = true
-- smart case sensitive search
set.smartcase = true
set.ignorecase = true
-- give more space for displaying messages.
set.cmdheight=1
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set.updatetime = 300
-- Don't pass messages to |ins-completion-menu|.
set.shortmess = set.shortmess + "c"
-- Highlight search toggle
set.hlsearch = true
-- Display all matching files when we tab complete in command mode
set.wildmenu = true
set.wildmode = "list:full"
set.signcolumn = "yes"
set.shell = "sh"
set.wrap = true