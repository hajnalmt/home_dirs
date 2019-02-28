"""""""""""""""""""""""""""""""""""""
" My additional vimrc configuration "
"""""""""""""""""""""""""""""""""""""

" Numbering.
set number

" Highligting Trailing spaces
match Todo /\s\+$/

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
