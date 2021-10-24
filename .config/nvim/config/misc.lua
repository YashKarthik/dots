-- which key
require("which-key").setup()

-- treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  indent = {enable = true}
}


-- nvim-lint
require('lint').linters_by_ft = {
  markdown = {'vale'},
  python = {'pylint'},
}

-- add diagnostics to quickfix list
do
  local method = "textDocument/publishDiagnostics"
  local default_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
    default_handler(err, method, result, client_id, bufnr, config)
    local diagnostics = vim.lsp.diagnostic.get_all()
    local qflist = {}
    for bufnr, diagnostic in pairs(diagnostics) do
      for _, d in ipairs(diagnostic) do
	d.bufnr = bufnr
        d.lnum = d.range.start.line + 1
        d.col = d.range.start.character + 1
        d.text = d.message
        table.insert(qflist, d)
      end
    end
    vim.lsp.util.set_qflist(qflist)
  end
end

-- fluttter-tools
require("flutter-tools").setup()

-- gitsign.nvim
require('gitsigns').setup()

-- indent_blankline
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
	show_end_of_line = true,
	space_char_blankline = " ",
}


-- auto-pairs and auto-tagging in html-cass
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
