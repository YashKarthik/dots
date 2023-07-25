local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local nmap      = bind("n", {noremap = false})
local imap      = bind("i", {noremap = false})

local nnoremap  = bind("n")
local vnoremap  = bind("v")
local xnoremap  = bind("x")
local snoremap  = bind("s")
local inoremap  = bind("i")

vim.g.mapleader = " "
vim.g.maplocalleader = "m"

-- paste over highlight without losing stuff in d register
xnoremap("<leader>p", "\"_dP")

-- delete stuff without losing stuff in d register
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- search dots
nnoremap("<leader>fp", function()
    require('yash.telescope').search_dotfiles()
end)

-- search files
nnoremap("<leader>.", ":Telescope find_files <CR>")
-- open tele
nnoremap("<leader>t", ":Telescope <CR>")

-- C-w is same as <leader>w
nnoremap("<leader>w", "<c-w>")

-- Reload init.lua
nnoremap("<leader>so", ":so ~/.config/nvim/init.lua")

-- snippets
vim.cmd [[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
    
    snoremap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
]]

-- Emacs key mapping in insert mode
imap("<C-a>", "<Home>")
imap("<C-e>", "<End>")
imap("<C-b>", "<ESC>bi")
imap("<C-f>", "<ESC>wa")
imap("<C-n>", "<ESC>ja")
imap("<C-p>", "<ESC>ka")
