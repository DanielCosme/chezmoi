-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
    -- Lsp & autocomplete
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    -- Colors
	use 'folke/tokyonight.nvim'
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
end)

