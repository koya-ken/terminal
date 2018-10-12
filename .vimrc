set number
set hlsearch
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

let $VIM = $HOME.'/settings/vim'

let $VIMRC = $VIM.'/vimrc'

if filereadable($VIMRC)
  source $VIMRC
endif
