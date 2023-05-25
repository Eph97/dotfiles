function! RunPy()
    " if rmarkdown#nrrwrgn#InsideRChunk() == 1
	" let range = rmarkdown#nrrwrgn#ChunkRange()
	" exe range[0].','.range[1].'SlimeSend'
    " else
    let fp = '"' . expand("%:p") . '"'
    call slime#send("exec(open(".fp.").read())\r")
    " endif
endfunction

command! RunPy call RunPy()

