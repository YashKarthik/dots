return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        "williamboman/mason.nvim",
        config = function() require'mason'.setup() end
    }

    -- colors
    use 'folke/tokyonight.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'folke/twilight.nvim',
        config = function() require('twilight').setup() end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use {
        'levouh/tint.nvim',
        config = function() require'tint'.setup{} end
    }

    use {
        'winston0410/range-highlight.nvim',
        requires = {'winston0410/cmd-parser.nvim'},
        config = function() require'range-highlight'.setup() end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end
    }

    -- nice utils

    use {
        'folke/which-key.nvim',
        config = function() require('which-key').setup() end
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- lodash basically
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0'
    }

    use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'TimUntersberger/neogit',
        config = function() require('neogit').setup() end
    }

    -- completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'L3MON4D3/LuaSnip',
        tag = 'v<CurrentMajor>.*',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            local luasnip = require('luasnip')
            luasnip.filetype_extend('javascript', { 'html' })
            luasnip.filetype_extend('typescript', { 'html' })
            luasnip.filetype_extend('javascriptreact', { 'html' })
            luasnip.filetype_extend('typescriptreact', { 'html' })
        end
    }
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind.nvim'

    -- debug
    use {
        'kevinhwang91/nvim-bqf',
        ft='qf',
        config = function()
            require"bqf".setup({
                preview = {
                    wrap = true
                }
            })
        end
    }

end
)
