vim.cmd [[
try
  colorscheme tender
  hi Normal ctermbg=0 guibg=#000000
  highlight Visual ctermbg=22 guibg=#2e8b57
  highlight Search term=reverse cterm=bold ctermfg=15 ctermbg=242 gui=bold guifg=#ffffff guibg=#666666
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
