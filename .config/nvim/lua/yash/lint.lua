require('lint').linters_by_ft = {
  verilog = {'verilator'},
  systemverilog = {'verilator'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

local ns = require("lint").get_namespace("verilator")
vim.diagnostic.config({ virtual_text = true }, ns)
