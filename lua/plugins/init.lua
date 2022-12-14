return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use { 'akinsho/bufferline.nvim', tag = "v1.*", requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use { 'windwp/nvim-ts-autotag' }
  use { 'windwp/nvim-autopairs' }
  use { 'folke/which-key.nvim' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = "require('toggleterm-config')" }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'

  use { 'lewis6991/gitsigns.nvim',
    config = "require('gitsigns-config')"
  }

  use { "terrortylor/nvim-comment" }
  use { 'glepnir/dashboard-nvim' }
end)
