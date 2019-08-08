
set nocompatible "vim won t pretend to act like vi & required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'bfrg/vim-cpp-modern'

" Put all standard C and C++ keywords under Vim's highlight group `Statement`
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

let g:cpp_class_scope_highlight = 1

let g:cpp_member_variable_highlight = 1

let g:cpp_class_decl_highlight = 1

let g:cpp_experimental_simple_template_highlight = 1

let g:cpp_concepts_highlight = 1

let c_no_curly_error = 1

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\ 'ctermfgs': ['lightblue', 'lightyellow', 'red', 'lightgreen', 'lightmagenta', 'darkred', 'green'],
\ 'parentheses': [
\ 'start=/(/ end=/)/ fold',
\ 'start=/\[/ end=/\]/ fold',
\ 'start=/{/ end=/}/ fold',
\ 'start=/#ifdef/ end=/#endif/ fold',
\ 'start=/#ifndef/ end=/#endif/ fold',
\ ],
\}

Plugin 'nanotech/jellybeans.vim'



"Plugin 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0



" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:colorscheme jellybeans




"Documented vimrc with some explanations
"remember ^n means Ctrl+n

"remember about keycode 135 (keysym 0xff67, Menu) for case change
"on one letter ~
set encoding=utf-8 fileencodings=

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
set tabstop=4 "sizeof tabs = 2
"set list  "show every special characters
set ruler
set shiftwidth=4  "indent size
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
" for HTML
let @h = "$v^xi<\<Esc>pA\<Space></\<Esc>pF<"
