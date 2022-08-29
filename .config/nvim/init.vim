filetype on
syntax on

source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/colors.vim
source $HOME/.config/nvim/config/lsp.lua
source $HOME/.config/nvim/config/misc.lua

" galaxyline setup
luafile ~/Code/nvim_lua/plugins/statusline1.lua
"telescope
luafile ~/Code/nvim_lua/plugins/telescope.lua

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
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python3'

" no numbers in terminal
autocmd TermOpen * setlocal nonumber norelativenumber
" enter terminal in insert mode
autocmd TermOpen * startinsert

" ======================================================================
"                        Running the Code
" ======================================================================
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.jsx setf javascriptreact
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.mdx setf markdown

autocmd FileType python map <buffer> <leader>r :sp \| terminal python %<CR>
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4

autocmd FileType dart map <buffer> <leader>r :sp \| terminal dart %<CR>
autocmd FileType dart set tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType javascript map <buffer> <leader>rd :sp \| terminal npm run dev<CR>
autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType typescript  map <buffer> <leader>rd :sp \| terminal npm run dev<CR>
autocmd FileType typescript set tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType javascriptreact map <buffer> <leader>r :sp \| terminal npm run dev<CR>
autocmd FileType javascriptreact set tabstop=2 softtabstop=2 shiftwidth=2

autocmd FileType typescriptreact map <buffer> <leader>r :sp \| terminal npm run dev<CR>
autocmd FileType typescriptreact set tabstop=2 softtabstop=2 shiftwidth=2
