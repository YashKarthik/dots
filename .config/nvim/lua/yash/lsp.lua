-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd',           vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K',            vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi',           vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>',        vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa',    vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr',    vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wi',    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<space>D',     vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn',    vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca',    vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr',           vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f',     function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- BORDERS
--vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
--vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- language servers
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local servers = { 'pyright', 'tsserver', 'astro', 'tailwindcss', 'gopls', 'clangd', 'verible'}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150}
    }
end

require("lspconfig.configs").solidity = {
    default_config = {
        cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
        filetypes = { 'solidity' },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
    },
}

lspconfig.solidity.setup {}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
