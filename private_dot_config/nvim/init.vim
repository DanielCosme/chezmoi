map ; :
let mapleader = "\<Space>" " Set space as leader

set filetype=on
set clipboard=unnamedplus " for x11
"set clipboard=unnamed " for win 10
set expandtab " insert spaces when tab is pressed
set tabstop=4 softtabstop=4 " number of spaces inserted when tab key pressed
set shiftwidth=4 " number of spaces inserted by < & > indent motions
set autoread

set smartindent " try to indent.
set number
set relativenumber " relative number lines.
set incsearch " incremental search.
set cursorline " highlight current line.
set lazyredraw    " redraw only when we need to.
set scrolloff=8 " show lines above and below cursor (when possible).
set sidescrolloff=8
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts.
set hidden " allow buffer to be hiden if modified.
set splitright
set noswapfile
set nobackup
" undo persist
set undodir=~/.vim/undodir
set undofile
" smart case sensitive search
set smartcase
set ignorecase

" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Highlight search toggle
set hlsearch
nnoremap <leader>\ :nohlsearch<CR> " Disable until next search

" Display all matching files when we tab complete in command mode
set wildmenu
set wildmode=list:full
set wildcharm=<C-Z>
set colorcolumn=90

"set signcolumn=number
set signcolumn=yes
set shell=sh

highlight ColorColumn ctermbg=black

syntax enable
filetype indent on " load filetype-specific indent files

" ----- PLUGINS -----

call plug#begin('~/.vim/plugged')

Plug 'fladson/vim-kitty'

" Color Schemes
Plug 'overcache/NeoSolarized'
Plug 'kaicataldo/material.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'ap/vim-css-color'

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'  " zen mode
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzy finder
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" --- go options

let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" -- Plugin Options ---
let g:NERDTreeGitStatusUseNerdFonts = 1
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

let g:airline_powerline_fonts = 1 " populate powerline symbols to arline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:goyo_linenr = 1
let g:goyo_width = 90

" ----- COLORS & THEMES -----
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
set background=dark " light

let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italics = 1
let g:neosolarized_termBoldAsBright = 0

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'

let g:edge_style = 'default' " 'neon' 'aura' 'default' 'dark'
let g:edge_enable_italic = 1

" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1

" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1


" Available values: `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1

" colorscheme nord
" colorscheme material
" colorscheme everforest
colorscheme gruvbox-material

" colorscheme NeoSolarized
" let g:airline_theme = 'solarized'
" let g:airline_solarized_bg= 'dark'

" highlight Normal guibg=none
" let g:airline_theme = 'material'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'e',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" --- Buffer switching ---
nnoremap <leader>q :bd <CR>
nnoremap <leader>s :<C-u>FZF<CR>

nnoremap <C-J> :bp <CR>
nnoremap <C-K> :bn <CR>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>lcd :lcd %:p:h<CR>:pwd<CR>
noremap <leader>f <C-W>w
nnoremap <leader>z :Goyo <CR>


function! s:goyo_enter()
  set nonu
  set nornu
endfunction

function! s:goyo_leave()
  set nu
  set rnu
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" --------------- LUA -----------------
lua << EOF
local nvim_lsp = require('lspconfig')
local lsp_installer = require "nvim-lsp-installer"
local servers = {
  "gopls",
}

-- install servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

-- server configurations
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD',       '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<C-]>',       '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',        '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi',       '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'gy',         '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gr',      '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d',         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d',         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>i',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

end

-- attach configuration to server

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


EOF
