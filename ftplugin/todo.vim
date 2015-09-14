" File specific to our .todo files
noremap <buffer> <leader>xd :execute 's/^\(\s*[-+*]\?\s*\)\[ \]/\1[x]/|nohlsearch'<cr>
noremap <buffer> <leader>xu :execute 's/^\(\s*[-+*]\?\s*\)\[x]/\1[ ]/|nohlsearch'<cr>
