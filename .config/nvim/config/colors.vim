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

" rainbow settings
"let g:rainbow_active = 1
"let g:rainbow_conf = {
"\	'guifgs': ['#ff9d00', 'yellow', '#007bff', '#874ecf', '#e84373'],
"\	'operators': '_,_',
"\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"\}
