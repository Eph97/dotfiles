function! RunStmd()
    " if rmarkdown#nrrwrgn#InsideRChunk() == 1
	" let range = rmarkdown#nrrwrgn#ChunkRange()
	" exe range[0].','.range[1].'SlimeSend'
    " else
    let fp = '"' . expand("%:p") . '"'
    call slime#send("markstat using".fp."\r")
    " endif
endfunction

command! RunStmd call RunStmd()
