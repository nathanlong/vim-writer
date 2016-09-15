" Writer.vim - Opinionated writing settings in Vim
" Maintainer:   Nathan Long (nathan-long.com)
" Version:      0.1

"Tracks state, open or closed
let g:writer_state = 0

"Set up Writer environment
fu! s:WriterInit(arg)
  setlocal spelllang=en_us
  setlocal complete+=kspell
  setlocal formatoptions=t textwidth=80
  nnoremap j gj
  nnoremap k gk

  "Check if the user has par for formatting paragraphs
  if executable('par') == 1
    setlocal formatprg=par\ -w80
  endif

  au BufUnload <buffer> call <sid>WriterClose()
  let g:writer_state = 1
endfunction

"Exit fullscreen and source defaults
fu! s:WriterClose()
  let g:writer_state = 0
  so $MYVIMRC
  so $MYGVIMRC
endfu

" Toggle between hard breaks at 80 characters and wrapped lines 
fu! s:WriterTextWrap()
  if &formatoptions =~# 't'
    setlocal formatoptions=l
    setlocal textwidth=0
    echo "Hard wrap turned off."
  else
    setlocal formatoptions=t
    setlocal textwidth=80
    echo "Hard wrap turned on."
  endif
endfu

" Toggle Writer on and off
fu! s:WriterToggle()
  if g:writer_state == 0
    call <sid>WriterInit('on')
  else
    call <sid>WriterClose()
  endif
endfu

command! WriterInit :call <sid>WriterInit('on')
command! WriterExit :call <sid>WriterClose()
command! Writer :call <sid>WriterToggle()
command! WriterWrap :call <sid>WriterTextWrap()
