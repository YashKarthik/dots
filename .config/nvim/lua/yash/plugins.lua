require('lazy').setup({

    -- colors
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require('kanagawa').setup({
    --             colors = {
    --                 theme = {
    --                     all = {
    --                         ui = {
    --                             bg_gutter = "none"
    --                         }
    --                     }
    --                 }
    --             },
    --             overrides = function(colors)
    --                 return {
    --                     ["@function.call.elixir"] = { fg = colors.palette.dragonOrange, italic = true },
    --                     ["@keyword.function.elixir"] = { fg = colors.palette.dragonOrange2},
    --                     ["@string.special.symbol.elixir"] = { fg = colors.palette.dragonPink },

    --                     TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
    --                     TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
    --                     TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
    --                     TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
    --                     TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
    --                     TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
    --                     TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim }
    --                 }
    --             end
    --         })


    --         vim.cmd [[set termguicolors]]
    --         vim.cmd.colorscheme('kanagawa-dragon')
    --     end,
    -- },

    ({
        'rose-pine/neovim',
        name = 'rose-pine'
            -------require("rose-pine").setup({
            -------    highlight_groups = {
            -------        ["@module"] = { fg = "foam" },
            -------        ["@string.special.symbol.elixir"] = { fg = "iris" },
            -------        ["@markup.raw.block.markdown"] = { fg = "muted" },
            -------        ["@string"] = { fg = "muted" },
            -------    },
            -------})
    }),

    --"savq/melange-nvim"

    {
      'maxmx03/solarized.nvim',
      lazy = false,
      priority = 1000,
      ---@type solarized.config
      opts = {
        variant = "autumn",
        styles = {
          enabled = true,
          keywords = { italic = true },
          constants = { italic = true },
        },
        --on_colors = function(colors, color)
        --  local tint = color.tint
        --  local blend = color.blend
        --  return {
        --    base3 = "#fbf1c7",
        --    base2 = "#fbf1c7"
        --}
        --end
      },
      config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'light'

        require('solarized').setup(opts)

        vim.cmd.colorscheme 'solarized'
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
        version = '0.1.6',
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

    -- Interactive Reply Over Nvim
    'Vigemus/iron.nvim',
    {
        'jpalardy/vim-slime',
        config = function()
            vim.g.slime_target = "tmux"
            vim.g.slime_default_config = {
                socket_name = "default",
                target_pane = "term"
            }
            vim.g.slime_dont_ask_default = 1
        end
    },

    -- completion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
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
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     lazy = false,
    --     version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    --     opts = {
    --         provider = "copilot",
    --         auto_suggestions_provider = "copilot",
    --         copilot = {
    --             endpoint = "https://api.githubcopilot.com",
    --             model = "claude-3.5-sonnet",
    --             timeout = 30000, -- Timeout in milliseconds
    --             temperature = 0,
    --             max_tokens = 4096,
    --         },
    --         behaviour = {
    --             auto_suggestions = true,
    --         },
    --         build = "make",
    --         mappings = {
    --             --- @class AvanteConflictMappings
    --             diff = {
    --                 ours = "co",
    --                 theirs = "ct",
    --                 all_theirs = "ca",
    --                 both = "cb",
    --                 cursor = "cc",
    --                 next = "]x",
    --                 prev = "[x",
    --             },
    --             suggestion = {
    --                 accept = "<C-CR>",
    --                 next = "<C-]>",
    --                 prev = "<S-C-]>",
    --                 dismiss = "<C-0>",
    --             },
    --             jump = {
    --                 next = "]]",
    --                 prev = "[[",
    --             },
    --             submit = {
    --                 normal = "<CR>",
    --                 insert = "<C-s>",
    --             },
    --             sidebar = {
    --                 apply_all = "A",
    --                 apply_cursor = "a",
    --                 switch_windows = "<Tab>",
    --                 reverse_switch_windows = "<S-Tab>",
    --             },
    --         },
    --         highlights = {
    --             ---@type AvanteConflictHighlights
    --             diff = {
    --                 current = "Visual",
    --                 incoming = "Search",
    --             }, 
    --             diff = {
    --                 current = "Visual",
    --                 incoming = "Search",
    --             },
    --             sidebar = {
    --                 normal = {
    --                     bg = "#e5e1d8",
    --                 },
    --             },
    --         },
    --         windows = {
    --             ---@type "right" | "left" | "top" | "bottom"
    --             position = "right", -- the position of the sidebar
    --             wrap = true, -- similar to vim.o.wrap
    --             width = 30, -- default % based on available width
    --             sidebar_header = {
    --                 enabled = false -- true, false to enable/disable the header
    --             },
    --             input = {
    --                 prefix = "> ",
    --                 height = 8, -- Height of the input window in vertical layout
    --             },
    --             ask = {
    --                 floating = false, -- Open the 'AvanteAsk' prompt in a floating window
    --                 start_insert = true, -- Start insert mode when opening the ask window
    --                 border = "none",
    --                 ---@type "ours" | "theirs"
    --                 focus_on_apply = "theirs", -- which diff to focus after applying
    --             },
    --         },
    --         suggestion = {
    --             debounce = 75,
    --             throttle = 0,
    --         },
    --     },
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    --         "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    --         "zbirenbaum/copilot.lua" -- for providers='copilot'
    --     },
    -- }
})

