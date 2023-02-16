command! -nargs=* Rundo call RunDo(<f-args>)


function! StataBatch()
    " if rmarkdown#nrrwrgn#InsideRChunk() == 1
	" let range = rmarkdown#nrrwrgn#ChunkRange()
	" exe range[0].','.range[1].'SlimeSend'
    " else
	set autochdir
    let fp = '"' . expand("%") . '"'
    " call slime#send("exec(open(".fp.").read())\r")
	call system(join(['stata -b -q run', fp]))
    " endif
endfunction
command! StataBatch call StataBatch()
