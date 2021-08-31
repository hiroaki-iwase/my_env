augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
  set nu
  set noswapfile
augroup END

set laststatus=2
set nu
