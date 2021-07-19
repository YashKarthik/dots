filetype on
syntax on

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/lsp.lua
source $HOME/.config/nvim/config/misc.lua
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/colors.vim

" galaxyline setup
luafile ~/Code/nvim_lua/plugins/statusline1.lua

"some stuff
autocmd CompleteDone * if !pumvisible() | pclose | endif
au BufWritePost <buffer> lua require('lint').try_lint()

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumForwardTrigger = '<tab>'
let g:UltiSnipsJumBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips"]


" Python shit
let g:python_highlight_all = 1
let python_highlight_all=1
let g:python3_host_prog='/Users/Yash/anaconda3/bin/python'
let g:python_host_prog='/usr/bin/python2'

" rainbow settings
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#ff9d00', 'yellow', '#007bff', '#874ecf', '#e84373'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}

" VimWiki syntax highlighting, will prolly move to orgmode.nvim
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh', 'fish': 'fish', 'javascript': 'js', 'html': 'html', 'css': 'css', 'dart': 'dart'}
let g:vimwiki_hl_cb_checked=2
let g:vimwiki_conceallevel=3
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
let g:vimwiki_list = [wiki]

" vimwiki spell checker
autocmd BufRead,BufNewFile   *.wiki setlocal spell spelllang=en_us

" no numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber
" enter terminal in insert mode
autocmd TermOpen * startinsert

" ======================================================================
"                        Running the Code
" ======================================================================
autocmd FileType python map <buffer> <leader>r :sp \| terminal python %<CR>
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4

autocmd FileType dart map <buffer> <leader>r :sp \| terminal dart %<CR>
autocmd FileType dart set tabstop=2 softtabstop=2 shiftwidth=2

