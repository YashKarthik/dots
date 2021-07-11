-- which key
require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = {enable = true},
  indent = {enable = false}
}

-- nvim-lint
require('lint').linters_by_ft = {
  markdown = {'vale'},
  python = {'pylint'},
}
