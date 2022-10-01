return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colors
  use 'folke/tokyonight.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  use {
      'norcalli/nvim-colorizer.lua',
      config = function() require'colorizer'.setup() end
  }

  use {
      'sunjon/shade.nvim',
      config = function() require'shade'.setup() end
  }

  use {
      "folke/twilight.nvim",
      config = function() require("twilight").setup() end
  }

  use {
      'winston0410/cmd-parser.nvim',
      requires = {'winston0410/range-highlight.nvim'},
      config = function() require'range-highlight'.setup() end
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function() require('lualine').setup() end
  }

  -- nice utils

  use {
      "folke/which-key.nvim",
      config = function() require("which-key").setup() end
  }

  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup() end
  }

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0'
  }

  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'nvim-treesitter/playground'

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }
  end
)
