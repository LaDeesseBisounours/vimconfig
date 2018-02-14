set encoding=utf-8 fileencodings=
syntax on
set colorcolumn=80
set number
colo torte
set tabstop=2
set list
set shiftwidth=2
set expandtab

inoremap jk <Esc>
inoremap kj <Esc>

inoremap {  {<Return>}<Up><Right><Return>
inoremap {{ {
inoremap {} {}

inoremap (  ()<Left>
inoremap () ()
inoremap (( (

inoremap "  ""<Left>
inoremap "" ""

inoremap <  ><Left><
inoremap << <<
inoremap <<Space> <<Space>
inoremap <=  <=

inoremap [  []<Left>
inoremap [] []
inoremap [[ [

inoremap #pr #pragma<Space>once<Return><Return>
inoremap #inc #include<Space>

nnoremap <Backspace> <Del>

filetype plugin indent on
