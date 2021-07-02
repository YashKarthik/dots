            " required
filetype on                   " required
filetype plugin on
syntax on

" ======================================================================
"                         VIM PLUG
" ======================================================================
call plug#begin('~/.vim/plugged')



Plug 'ghifarit53/tokyonight-vim'
Plug 'gko/vim-coloresque'
Plug 'folke/which-key.nvim'
Plug 'vimwiki/vimwiki'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'lukas-reineke/indent-blankline.nvim' , {'branch': 'lua'}
Plug 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call plug#end()

" ======================================================================
"                        other settings 
" ======================================================================
"
"

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" galaxyline setup
luafile ~/Code/nvim_lua/plugins/statusline1.lua

"indendation settings
set tabstop=4|
set softtabstop=4|
set shiftwidth=4|
set textwidth=79|
set autoindent|
set fileformat=unix|

" Python shit
nnoremap <leader>r :!clear;python %<CR>

let g:python_highlight_all = 1
let python_highlight_all=1
let g:python3_host_prog='/opt/anaconda3/bin/python'

" rainbow settings
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#ff9d00', 'yellow', '#007bff', '#874ecf', '#e84373'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

" colors
if &background == "dark"     
  let s:base03 = "NONE"     
  let s:base02 = "NONE"     
endif

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

function! MyHighlights() abort
	highlight link CompeDocumentation NormalFloat
    highlight Visual     cterm=NONE ctermfg=226 ctermfg=16  gui=NONE guibg=#fcfca9 guifg=#000000
    highlight Search cterm=NONE ctermfg=226 ctermfg=16  gui=NONE guibg=#fcfca9 guifg=#000000
	highlight Comment cterm=italic gui=italic ctermfg=lightgreen
	hi VimwikiItalic guifg=#927ac4
	hi VimWikiBlockquotes guifg=#393d45
	hi VimwikiBold guifg=#f5da6e
	hi VimwikiLink guifg=#927ac4
	hi VimwikiHeader1 guifg=#ff4800
	hi VimwikiHeader2 guifg=lightgreen
	hi VimwikiHeader3 guifg=#007bff
	hi VimwikiHeader4 guifg=#80f2c9
	hi VimwikiHeader5 guifg=#eb91ab
	hi VimwikiHeader6 guifg=#f5da6e
	hi Statusline guifg=#a9b1d6 guibg=#202328
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme tokyonight 

" VimWiki syntax highlighting
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'fish': 'fish', 'javascript': 'js', 'html': 'html', 'css': 'css'}
let g:vimwiki_hl_cb_checked=2
let g:vimwiki_conceallevel=3
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
let g:vimwiki_list = [wiki]

" vimwiki spell checker
autocmd BufRead,BufNewFile   *.wiki setlocal spell spelllang=en_us

"" ale linter
"let b:ale_linters = ['pylint']
"" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8']
"" Disable warnings about trailing whitespace for Python files.
"let b:ale_warn_about_trailing_whitespace = 0


if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  	set termguicolors
endif

" no numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" mappings and my shortcuts
let mapleader=" "
map Q <Nop>

" source
nnoremap <Leader>s :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s1 :so ~/Code/alt_config.vim<CR>

" open scartch-pad in new tab
nnoremap <Leader>sc :tabnew ~/vimwiki/Scratch-pad.wiki<CR>

            " required
filetype on                   " required
filetype plugin on
syntax on

" ======================================================================
"                         VIM PLUG
" ======================================================================
call plug#begin('~/.vim/plugged')



Plug 'ghifarit53/tokyonight-vim'
Plug 'gko/vim-coloresque'
Plug 'folke/which-key.nvim'
Plug 'vimwiki/vimwiki'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'lukas-reineke/indent-blankline.nvim' , {'branch': 'lua'}
Plug 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call plug#end()

" ======================================================================
"                        other settings 
" ======================================================================
"
"

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" galaxyline setup
luafile ~/Code/nvim_lua/plugins/statusline1.lua

"indendation settings
set tabstop=4|
set softtabstop=4|
set shiftwidth=4|
set textwidth=79|
set autoindent|
set fileformat=unix|

" Python shit
nnoremap <leader>r :!clear;python %<CR>

let g:python_highlight_all = 1
let python_highlight_all=1
let g:python3_host_prog='/opt/anaconda3/bin/python'

" rainbow settings
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#ff9d00', 'yellow', '#007bff', '#874ecf', '#e84373'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

" colors
if &background == "dark"     
  let s:base03 = "NONE"     
  let s:base02 = "NONE"     
endif

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

function! MyHighlights() abort
	highlight link CompeDocumentation NormalFloat
    highlight Visual     cterm=NONE ctermfg=226 ctermfg=16  gui=NONE guibg=#fcfca9 guifg=#000000
    highlight Search cterm=NONE ctermfg=226 ctermfg=16  gui=NONE guibg=#fcfca9 guifg=#000000
	highlight Comment cterm=italic gui=italic ctermfg=lightgreen
	hi VimwikiItalic guifg=#927ac4
	hi VimWikiBlockquotes guifg=#393d45
	hi VimwikiBold guifg=#f5da6e
	hi VimwikiLink guifg=#927ac4
	hi VimwikiHeader1 guifg=#ff4800
	hi VimwikiHeader2 guifg=lightgreen
	hi VimwikiHeader3 guifg=#007bff
	hi VimwikiHeader4 guifg=#80f2c9
	hi VimwikiHeader5 guifg=#eb91ab
	hi VimwikiHeader6 guifg=#f5da6e
	hi Statusline guifg=#a9b1d6 guibg=#202328
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme tokyonight 

" VimWiki syntax highlighting
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'fish': 'fish', 'javascript': 'js', 'html': 'html', 'css': 'css'}
let g:vimwiki_hl_cb_checked=2
let g:vimwiki_conceallevel=3
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
let g:vimwiki_list = [wiki]

" vimwiki spell checker
autocmd BufRead,BufNewFile   *.wiki setlocal spell spelllang=en_us

"" ale linter
"let b:ale_linters = ['pylint']
"" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8']
"" Disable warnings about trailing whitespace for Python files.
"let b:ale_warn_about_trailing_whitespace = 0


if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  	set termguicolors
endif

" no numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" mappings and my shortcuts
let mapleader=" "
map Q <Nop>

" source
nnoremap <Leader>s :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s1 :so ~/Code/alt_config.vim<CR>

" open scartch-pad in new tab
nnoremap <Leader>sc :tabnew ~/vimwiki/Scratch-pad.wiki<CR>

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" :telescope
map <silent> <Leader>t :Telescope
map <silent> <Leader>f :Telescope find_files<CR>
map <silent> <Leader>F :Telescope file_browser<CR>
map <silent> <Leader>con :lua require('Code.nvim_lua.plugins.telescope').search_dotfiles()<CR>

"split navigations
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>

"split resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 32/20)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <Leader><Leader>+ :exe "vertical resize " . (winwidth(0) * 32/20)<CR>
nnoremap <silent> <Leader><Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <leader><leader>= <C-w>=

lua << EOF
local nvim_lsp = require('lspconfig')
-- debuging
vim.lsp.set_log_level("debug")

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>N', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>g", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"pyright"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

EOF

" lsp completion
let g:completion_matching_ignore_case = 1
let g:completion_enable_snippet = 'UltiSnips'
"Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet', 'buffer']},
			\	{'mode' : 'cmd'}
			\	],
			\'python' : [
			\	{'complete_items': ['ts', 'lsp']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
			\}

"lsp auto-format before save
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)

" nvim-compe uses default
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.emoji = v:true

" nvim-lint
lua << EOF
require('lint').linters_by_ft = {
  markdown = {'vale'},
  python = {'pylint'}
}
EOF

au BufWritePost <buffer> lua require('lint').try_lint()
" =======================================================================================
" other settings
" =======================================================================================

set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=15
set sidescroll=10
set noshowmode
set belloff=all
set incsearch
set autowrite
set nowrap
set sidescroll=10
set textwidth=90
"set completeopt=menuone,longest,preview,noinsert,noselect
set completeopt=menuone,noselect
autocmd CompleteDone * if !pumvisible() | pclose | endif
set encoding=utf-8
set guifont=Fira\ Code:h14
set splitbelow splitright
set background=dark 
set nu rnu
set linespace=5
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpre()
set cmdheight=1
set cocu="n"
set cole=2
set fdm=manual
set tm=500
set nohlsearch
set shell=/bin/bash
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" :telescope
map <silent> <Leader>t :Telescope
map <silent> <Leader>f :Telescope find_files<CR>
map <silent> <Leader>F :Telescope file_browser<CR>
map <silent> <Leader>con :lua require('Code.nvim_lua.plugins.telescope').search_dotfiles()<CR>

"split navigations
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>

"split resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 32/20)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <Leader><Leader>+ :exe "vertical resize " . (winwidth(0) * 32/20)<CR>
nnoremap <silent> <Leader><Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <leader><leader>= <C-w>=

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>N', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>g", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "dartls"}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup{
		on_attach = on_attach,
		autostart = true
	}
end
EOF

" lsp completion
let g:completion_matching_ignore_case = 1
let g:completion_enable_snippet = 'UltiSnips'
"Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet', 'buffer']},
			\	{'mode' : 'cmd'}
			\	],
			\'python' : [
			\	{'complete_items': ['ts', 'lsp']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
			\}

"lsp auto-format before save
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)

" nvim-compe uses default
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.emoji = v:true

" nvim-lint
lua << EOF
require('lint').linters_by_ft = {
  markdown = {'vale'},
  python = {'pylint'}
}
EOF

au BufWritePost <buffer> lua require('lint').try_lint()
" =======================================================================================
" other settings
" =======================================================================================

set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=15
set sidescroll=10
set noshowmode
set belloff=all
set incsearch
set autowrite
set nowrap
set sidescroll=10
set textwidth=90
"set completeopt=menuone,longest,preview,noinsert,noselect
set completeopt=menuone,noselect
autocmd CompleteDone * if !pumvisible() | pclose | endif
set encoding=utf-8
set guifont=Fira\ Code:h14
set splitbelow splitright
set background=dark 
set nu rnu
set linespace=5
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpre()
set cmdheight=1
set cocu="n"
set cole=2
set fdm=manual
set tm=500
set nohlsearch
set shell=/bin/bash
