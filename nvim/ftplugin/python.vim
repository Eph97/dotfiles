function! RunPy()
    if python#nrrwrgn#InsidePyChunk() == 1
		call python#nrrwrgn#SlimeSend()
	elseif &buftype=="acwrite"
		echo "acwrite"
		exe '0,$ SlimeSend'
	else
		let fp = '"' . expand("%:p") . '"'
		call slime#send("exec(open(".fp.").read())\r")
	endif
    " endif
endfunction

command! RunPy call RunPy()

