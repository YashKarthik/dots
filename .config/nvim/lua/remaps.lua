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
local nnoremap  = bind("n")
local vnoremap  = bind("v")
local xnoremap  = bind("x")
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
    require('telescope').search_dotfiles({ hidden = true })
end)

-- search files
nnoremap("<leader>.", function()
    require('telescope').search_dotfiles({ hidden = true })
end)
