" -------------Zoom-------------
" Opens current buffer in a new window if there are more than one windows open
" Otherwise closes the current buffer
function! ToggleZainabZoom()
  " to save the cursor position
  let l:winview = winsaveview()

  if winnr('$') == 1
    " if there is just one window open
    " close this window
    :close
  else
    " open the current window in a new tab
    :tabe %
  endif

  " restore cursor position
  call winrestview(l:winview)
endfunction

nnoremap <leader>xi :call ToggleZainabZoom()<cr>

" -------------Scratch-------------
" Open scratch file from dropbox
" You can symlink scratch into Dropbox so that it is
" synced across multiple machines which you use
function! OpenScratch()
  exec 'sp '. $HOME . '/.scratch/'. split(getcwd(), '/')[-1]
endfunction
nnoremap <leader>xx :call OpenScratch()<cr>

" -------------Quick TODO-------------
" Open a global quick todo file
" You can symlink quick.todo into Dropbox so that it is
" synced across multiple machines which you use
function! OpenQuickTodo()
  exec 'tabnew '. $HOME . '/quick.todo'
endfunction
nnoremap <leader>xt :call OpenQuickTodo()<cr>

" -------------Ctags-------------
" run ctags
nnoremap <leader>xc :execute '!ctags -R &> /dev/null \| echo creating-tags-file'<cr>

" -------------Reformat-------------
" reformat the file
function! ReformatCode()
  " to save the cursor position
  let l:winview = winsaveview()
  if &ft == "go"
    :execute 'Fmt'
    echo "go fmted!"
  elseif &ft == "javascript"
    :call g:Jsbeautify()
    echo "js beautified!"
  else
    :exe 'normal gg=G'
  endif
  call winrestview(l:winview)
endfunction
nnoremap <leader>xf :call ReformatCode()<cr>

" -------------Execute current line as vim-------------
nnoremap <leader>xv :execute getline(".")<cr>

" -- Close current buffer --
nnoremap <leader>xd :close<cr>

" computes the value of the current line
:nnoremap <leader>xe :!bc<cr>

" computes the value of the current line
:nnoremap <leader>xw :<cr>

" tab navigation
:nnoremap <leader>xj :tabp<cr>
:nnoremap <leader>xk :tabn<cr>
