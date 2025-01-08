require('lazy').setup({

    -- colors
    -- ({ 'rose-pine/neovim', name = 'rose-pine' }),
    -- 'folke/tokyonight.nvim'
    --"savq/melange-nvim"
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        config = function()
            vim.cmd [[set termguicolors]]
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = 'soft'
            vim.cmd.colorscheme('gruvbox-material')
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function () require("ibl").setup({
            indent = {char = "·" },
            scope = { enabled = false },
        }
        ) end
    },

    {
        'folke/twilight.nvim',
        config = function() require('twilight').setup() end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end,
    },

    --{
    --    'levouh/tint.nvim',
    --    config = function() require'tint'.setup{} end,
    --},

    {
        'winston0410/range-highlight.nvim',
        dependencies = {'winston0410/cmd-parser.nvim'},
        config = function() require'range-highlight'.setup() end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
        config = function() require('lualine').setup() end,
    },

    -- nice utils
    'folke/which-key.nvim',
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end,
    },

    -- lodash basically
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        version = '0.1.6'
    },

    { 'nvim-treesitter/nvim-treesitter', build=':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-context',
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require("aerial").setup({
            on_attach = function(bufnr)
                vim.keymap.set("n", "<leader>an", "<cmd>AerialNavOpen<CR>", { buffer = bufnr })
            end,
        })
        end
    },

    -- git
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end,
    },
    {
        'tpope/vim-fugitive'
    },

    -- completion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            local luasnip = require('luasnip')
            luasnip.filetype_extend('javascript', { 'html' })
            luasnip.filetype_extend('typescript', { 'html' })
            luasnip.filetype_extend('javascriptreact', { 'html' })
            luasnip.filetype_extend('typescriptreact', { 'html' })
        end,
    },
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',

    -- linting
    'mfussenegger/nvim-lint',

    -- debugging
     "nvim-neotest/nvim-nio",
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'leoluz/nvim-dap-go',
    {
        'kevinhwang91/nvim-bqf',
        ft='qf',
        config = function()
            require"bqf".setup({
                preview = {
                    wrap = true
                },
            })
        end,
    },

    --copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-Tab>",
                        accept_word = "<M-w>",
                        accept_line = "<M-l>",
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                }
            })
        end,
    }
})

