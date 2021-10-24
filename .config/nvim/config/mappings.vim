let mapleader=" "
map Q <Nop>

" source
nnoremap <Leader>s :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s1 :so ~/Code/alt_config.vim<CR>

" open scartch-pad in new tab
nnoremap <Leader>sc :tabnew ~/vimwiki/Scratch-pad.wiki<CR>

" cd into current dir
nnoremap <Leader>cd :lcd %:p:h<CR><bar>:pwd<CR>

" delete text losing copied stuff and past the copied stuff into that place
vnoremap <leader>p "_dP

" :telescope
map <Leader>t :Telescope
map <silent> <Leader>f :Telescope find_files<CR>
map <silent> <Leader>F :Telescope file_browser<CR>
" figure this out for different dirs
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
