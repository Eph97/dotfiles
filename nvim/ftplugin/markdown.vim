" markdown stuff{{{
function! Mdview()
  let pdf = '"' . expand("%:p:r") . '.pdf' . '"'
  call Pandoc()
  if !system("pgrep -a zathura | grep " . pdf . " | awk '{print $1}'")
    execute "silent !zathura " .  pdf . " &"
  else
    echo "Already Open"
  endif
endfunction

function! Pandoc()
  let pdf = '"' . expand("%:p:r") . '.pdf' . '"'
  let fp = '"' . expand("%:p") . '"'
  call system(join(['pandoc', fp, '-o', pdf]))
  " echo join(['pandoc', fp, '-o', pdf])
endfunction

function! AutoPandoc()
  let pdf = '"' . expand("%:p:r") . '.pdf' . '"'
  let fp = '"' . expand("%:p") . '"'
  if filereadable(pdf)
    call system(join(['pandoc', fp, '-o', pdf]))
  endif
endfunction


augroup filetype_markdow
	autocmd!
        autocmd BufWritePost *.md :call AutoPandoc()
augroup END

command! Mdview call Mdview()
" }}}
