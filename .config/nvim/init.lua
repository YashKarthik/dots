local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------

if not vim.g.vscode then
    require("yash.sets")
    require('yash.remaps')
    require('yash.netrw')
    require("yash.plugins")
    require('yash.lsp')
    require('yash.nvim-cmp')
    require("yash.treesitter")
    require('yash.ts-context')
    require("yash.lualine")
    require("yash.lint")
    require("yash.debugging")
end
