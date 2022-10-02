-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    -- Packer can manage itself
	use 'wbthomason/packer.nvim'
    -- Terminal
	use {
        'akinsho/toggleterm.nvim',
        tag = '*',
    }
    -- LSP and external packages like DAP (debug adapter protocol)
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'williamboman/mason-lspconfig.nvim' -- makes it easier to use lspconfig with mason.nvim 
    use 'mfussenegger/nvim-dap' -- basic debugger
    use 'jose-elias-alvarez/null-ls.nvim' -- linters and formatters with LSP functions
    use 'williamboman/mason.nvim'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    -- Autocompletion and snippets engine
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim' -- vscode-like icons
    -- Comments
    use {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim",
    }
    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- Colors
	use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use "EdenEast/nightfox.nvim"
    use { 'Everblush/everblush.nvim', as = 'everblush' }
    use 'navarasu/onedark.nvim'
    use 'sainnhe/everforest'
    use 'shaunsingh/moonlight.nvim'
    use 'olivercederborg/poimandres.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'B4mbus/oxocarbon-lua.nvim'
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }
    -- Finder
    use {'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate'
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Other
    use 'nvim-lua/plenary.nvim'
    -- Nvim Tree
    use 'kyazdani42/nvim-web-devicons'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- Git
    use 'lewis6991/gitsigns.nvim'
    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Context
    use 'nvim-treesitter/nvim-treesitter-context'
    -- Go tooling
    use 'fatih/vim-go'
end)

