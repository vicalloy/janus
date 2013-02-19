set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

set nonumber "不显示行号
set noexpandtab "不显示tab
set nolist "不显示末尾空格
set noignorecase  "搜索时大小写敏感
au BufRead,BufNewFile *.py set filetype=python

set cursorline
hi CursorLine cterm=bold ctermbg=DarkBlue
set background=dark
colorscheme solarized
"colorscheme blackboard desert
set nobackup
set autochdir
set tags=./tags
set tags+=tags;/
set nowrap
set guioptions+=b
set fileformats=unix ",dos
set encoding=utf-8    " Set default encoding to UTF-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1
if has('win32')
  set gfn=DejaVu_Sans_Mono:h10
else
  set gfn=Deja\ Vu\ Sans\ Mono\ 10
endif

let g:syntastic_python_checker_args = "--ignore E501,E128"

" tab navigation  
nnoremap tl :tabnext<CR>  
nnoremap th :tabprev<CR>  
nnoremap tn :tabnew<CR>  
nnoremap tc :tabclose<CR>  
nnoremap <leader>ct :CtrlP<CR>  

nnoremap tt :NERDTree<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q! | endif
let g:fencview_autodetect = 1   "打开文件时自动识别编码
let g:fencview_checklines = 10 "检查前后10行来判断编码

au FileType python setlocal et sw=4 ts=4
au FileType html setlocal et sw=2 ts=2
au FileType javascript setlocal et sw=2 ts=2

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
