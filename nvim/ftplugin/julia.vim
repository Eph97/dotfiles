function! RunJl()
    " if rmarkdown#nrrwrgn#InsideRChunk() == 1
	" let range = rmarkdown#nrrwrgn#ChunkRange()
	" exe range[0].','.range[1].'SlimeSend'
    " else
    let fp = '"' . expand("%:p") . '"'
    call slime#send("include(".fp.")\r")
    " endif
endfunction

command! RunJl call RunJl()
