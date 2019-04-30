set encoding=utf-8 fileencodings=
syntax on
set colorcolumn=80
set number
colo perso
set tabstop=2
set list
set ruler
set shiftwidth=2
set expandtab
set textwidth=90
set virtualedit=all

inoremap {  {}<Left><Return><Esc>O
inoremap {{ {
inoremap {} {}

inoremap (  ()<Left>
inoremap () ()
inoremap (( (

inoremap "  ""<Left>
inoremap "" ""

inoremap '  '
inoremap '' ''<Left>
inoremap ''' ''

inoremap <  ><Left><
inoremap << <<
inoremap <<Space> <<Space>
inoremap <=  <=

inoremap [  []<Left>
inoremap [] []
inoremap [[ [

inoremap #pr #pragma<Space>once<Return><Return>
inoremap #inc #include

nnoremap <Backspace> <Del>

packadd termdebug

filetype plugin indent on
