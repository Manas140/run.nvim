fun! Run()
  lua for k in pairs(package.loaded) do if k:match("^Run") then package.loaded[k] = nil end end 
  lua require("Run").main()
endfun

com! Run call Run()
nmap <C-E> :Run<CR>

augroup Run
  autocmd!
augroup END
