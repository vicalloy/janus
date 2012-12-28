" Customization
"
" This loads after the janus plugins so that janus-specific plugin mappings can
" be overwritten.

" load vicalloy's custom settings
exe 'source ' . g:janus_vim_path . '/vicalloy.vim'
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
