function! LatexMake()
	if expand('%:e') ==# "sil"
		exe '!sile  ' . bufname("%")
	else
		exe '!pdflatex -interaction=nonstopmode -output-directory=' .
			\ shellescape(expand('%:p:h'), 1) .
			\ ' ' . expand('%')
			"\ . ' && rm -f ' .
			"\ shellescape(expand('%:r'), 1) . '.log ' .
			"\ shellescape(expand('%:r'), 1) . '.toc ' .
			"\ shellescape(expand('%:r'), 1) . '.aux '
	endif
endfunction

function! LatexView()
	exe '!evince ' . shellescape(expand('%:r'), 1) . '.pdf > /dev/null &'
endfunction

function! LatexClean()
	exe '!rm -f ' . shellescape(expand('%:r'), 1) . '.pdf ' .
		\ shellescape(expand('%:r'), 1) . '.log ' .
		\ shellescape(expand('%:r'), 1) . '.toc ' .
		\ shellescape(expand('%:r'), 1) . '.aux '
endfunction

nnoremap <leader>m :call LatexMake()<CR>
nnoremap <leader>n :call LatexView()<CR>
nnoremap <leader>v :call LatexClean()<CR>

call TextMode()
