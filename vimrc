"Documented vimrc with some explanations
"remember ^n means Ctrl+n

"remember about keycode 135 (keysym 0xff67, Menu) for case change
"on one letter ~
set encoding=utf-8 fileencodings=
set nocompatible "vim won t pretend to act like vi

set path +=** "tab completion for all file related and sub folder
set wildmenu  "display all matching files when using tab
"we can then just use :find myfile and vim will open it, you can also get some
"autocomplete with this
"to open a .c file you can just do :find *.c and press tab
":b will try to open file by default
"


"define :Maketags as running ctags -R .
"ctags allows to jump to definition of symbols inside projetc (IDE style)
command! Maketags !ctags -R .
"to jump to definition of a symbol ^]
"for ambiguous tag g ^]
"
"vim keeps track of jumps you made  ^o to go back and ^i to go forward


"autocomplete, documentation :help ins-completion
"(in insert mode)
"basic one ^n and ^p, they can be managed with variable completion
"just this file ^x ^n
"for filenames  ^x ^f
"using ctags    ^x ^]

"file browsing :help netrw-browse-maps
"also when cursor is on a filename gf will open the file

syntax on "color highlight
set colorcolumn=80
set number "show line numbers
colo perso
set tabstop=2 "sizeof tabs = 2
set list  "show every special characters
set ruler
set shiftwidth=2  "indent size
set expandtab     "when pressing tab adds spaces instead of tab
set textwidth=90
set virtualedit=all

"snippet exeample
"file $HOME/.vim/snippets/forloop.skeleton contains something like
"for (int k = 0; k < ; k++) {
"
"}
"this allow to prewrite some code like the usual for loop
nnoremap FOR :read $HOME/.vim/snippets/forloop.skeleton<CR>2jV2k:s/k/

"set makeprg=something   allows to set the action to do for compiling
":make to build your program
":cn :cp to go to next or previous error
":copen open a widow containing them all
"
"

inoremap {  {}<Left><Return><Esc>O
inoremap {{ {
inoremap {} {}

inoremap (  ()<Left>
inoremap () ()
inoremap (( (

inoremap "  ""<Left>
inoremap "" "
inoremap """ ""

inoremap '  ''<Left>
inoremap '' '
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

hi debugPC term=reverse ctermbg=red guibg=red
hi debugBreakpoint term=reverse ctermbg=red guibg=red
map <F11> :setlocal spell! spelllang=en_us<CR>
map <F12> :setlocal spell! spelllang=fr_FR<CR>


filetype plugin indent on
