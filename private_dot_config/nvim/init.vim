map ; :
let mapleader = "\<Space>" " Set space as leader

set filetype=on
set clipboard=unnamedplus " for x11
"set clipboard=unnamed " for win 10
set expandtab " insert spaces when tab is pressed
set tabstop=4 softtabstop=4 " number of spaces inserted when tab key pressed
set shiftwidth=4 " number of spaces inserted by < & > indent motions
set autoread

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2

set smartindent " try to indent
set number
set relativenumber " relative number lines
set incsearch " incremental search
set cursorline " highlight current line
set lazyredraw    " redraw only when we need to.
set scrolloff=5 " show lines above and below cursor (when possible)
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set hidden " allow buffer to be hiden if modified
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

set colorcolumn=80

"set signcolumn=number
set signcolumn=yes
set shell=sh

highlight ColorColumn ctermbg=black

syntax enable
filetype indent on " load filetype-specific indent files

" ----- PLUGINS -----

call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'overcache/NeoSolarized'

Plug 'b4b4r07/vim-sqlfmt' " sql formater
Plug 'junegunn/goyo.vim'  " zen mode
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzy finder
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion engine
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" --- SQL parser plugin options ---
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"
let g:sqlfmt_auto = 1
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
let g:javascript_plugin_jsdoc = 1 " js better color formating
let g:javascript_plugin_ngdoc = 1 " js better color formating
let g:javascript_plugin_flow = 1 " js better color formating
let g:goyo_linenr = 1

" ----- COLORS & THEMES -----
set termguicolors
set background=dark " light

" Material theme
let g:forest_night_enable_italic = 1

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
let g:neosolarized_termBoldAsBright = 0
" colorscheme nord
colorscheme material
" colorscheme forest-night
" colorscheme NeoSolarized

" highlight Normal guibg=none
" let g:airline_theme = 'material'


" FZF & COC
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'e',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-go',
  \  'coc-git',]

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" note: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use <c-space> to trigger completion.

"inoremap <silent><expr> <leader>9 coc#refresh()
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" --- Buffer switching ---
nnoremap <leader>0 :bd <CR>
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

