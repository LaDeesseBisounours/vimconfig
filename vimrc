set nocompatible "vim won t pretend to act like vi & required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'hdima/python-syntax'
let python_highlight_all=1
Plugin 'Neui/cmakecache-syntax.vim'

Plugin 'lifepillar/pgsql.vim'

"Plugin 'bfrg/vim-cpp-modern'

" Put all standard C and C++ keywords under Vim's highlight group `Statement`
" (affects both C and C++ files)
"let g:cpp_simple_highlight = 1

" Enable highlighting of named requirements (C++20 library concepts)
"let g:cpp_named_requirements_highlight = 1

"let g:cpp_class_scope_highlight = 1

"let g:cpp_member_variable_highlight = 1

"let g:cpp_class_decl_highlight = 1

"let g:cpp_experimental_simple_template_highlight = 1

"let g:cpp_concepts_highlight = 1

"let c_no_curly_error = 1

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\ 'ctermfgs': ['darkblue', 'darkred', 'darkgreen', 'darkmagenta', 'darkyellow', 'green', 'lightblue'],
\ 'parentheses': [
\ 'start=/(/ end=/)/ fold',
\ 'start=/\[/ end=/\]/ fold',
\ 'start=/{/ end=/}/ fold',
"\ 'start=/<[A-Za-z][^<>]*/ end=/>/ step=/,/ ',
\ 'start=/#ifdef/ end=/#endif/ fold',
\ 'start=/#ifndef/ end=/#endif/ fold',
\ ],
\}

Plugin 'nanotech/jellybeans.vim'

Plugin 'jaxbot/semantic-highlight.vim'

"Plugin 'bbchung/clighter8'

:nnoremap <F8> :SemanticHighlightToggle<cr>
  
let g:semanticTermColors = [ 1,2,3,6,9,10,11,12,13,14, 202,93,147,166,184, 220 ]

let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
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
command! Maketags !cscope -R -b
"to jump to definition of a symbol ^]
"for ambiguous tag g ^]
"
:set runtimepath+=~/.vim/bundle/cscope/cscope_maps.vim
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

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

syntax enable "color highlight
set colorcolumn=80
set number "show line numbers
set tabstop=4 "sizeof tabs = 2
"set list  "show every special characters
set ruler
set wrap "one line on the screen is considered as one line for vim
set shiftwidth=4  "indent size
set expandtab     "when pressing tab adds spaces instead of tab
set textwidth=90
set virtualedit=all
set clipboard=unnamed
set splitbelow
set splitright
set foldmethod=syntax

"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zc closes a fold under cursor. 
"[z go to beginning of fold
"]z got to end of fold

"set makeprg=something   allows to set the action to do for compiling
":make to build your program
":cn :cp to go to next or previous error
":copen open a widow containing them all
"
"
"cscope set up
"Code and explanations https://vim.fandom.com/wiki/Cscope
if has('cscope') 
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" -----imap------------------------------------------------------------------------
inoremap {  {}<Left><Return><Esc>O
inoremap {{ {
inoremap {} {}

inoremap (  ()<Left>
inoremap () ()
inoremap (( (

inoremap "  ""<Left>
inoremap "" "
inoremap """ ""

inoremap ''  ''<Left>

inoremap <  ><Left><
inoremap << <<
inoremap <<Space> <<Space>
inoremap <=  <=
inoremap <>  <>

inoremap [  []<Left>
inoremap [] []
inoremap [[ [

inoremap #pr #pragma<Space>once<Return><Return>
inoremap #inc #include<Space>

"---nmap-----------------------------------------------------------------------
nnoremap <Backspace> <Del>

"snippet exeample
"file $HOME/.vim/snippets/forloop.skeleton contains something like
"for (int k = 0; k < ; k++) {
"
"}
"this allow to prewrite some code like the usual for loop
nnoremap FOR :read $HOME/.vim/snippets/forloop.skeleton<CR>2jV2k:s/k/

"---map------------------------------------------------------------------------
noremap <F11> :setlocal spell! spelllang=en_us<CR>
noremap <F12> :setlocal spell! spelllang=fr_FR<CR>
noremap <F9> :% !clang-format %

"---cabrev----------------------------------------------------------------------
cnoreabbrev H vert h


packadd termdebug
hi debugPC ctermbg=red guibg=red
hi debugBreakpoint ctermbg=blue guibg=blue
hi Normal ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE  guifg=NONE ctermfg=NONE

"clighter8
"colors to use"
"darkblue 12
"blue 105
"light blue 111
"turquoise 117
"lightpurple 183
"magenta 170
"orange 214
"darkorange 166
"red 9
"green 37
"dark green 64
"gold 178
"
"
 

hi clighter8Decl  ctermfg=12
hi clighter8Ref  ctermfg=214
hi clighter8Prepro ctermfg=64
hi clighter8Stat  ctermfg=18

hi clighter8StructDecl ctermfg=105
hi clighter8UnionDecl ctermfg=12
hi clighter8ClassDecl ctermfg=105
hi clighter8EnumDecl ctermfg=12
hi clighter8FieldDecl ctermfg=12
hi clighter8EnumConstantDecl ctermfg=39
hi clighter8FunctionDecl ctermfg=12
hi clighter8VarDecl ctermfg=12
hi clighter8ParmDecl ctermfg=12
hi clighter8TypedefDecl ctermfg=12
hi clighter8CxxMethod ctermfg=37
hi clighter8Namespace ctermfg=64
hi clighter8Constructor ctermfg=105
hi clighter8Destructor ctermfg=105
hi clighter8TemplateTypeParameter ctermfg=170
hi clighter8TemplateNoneTypeParameter ctermfg=170
hi clighter8FunctionTemplate ctermfg=170
hi clighter8ClassTemplate ctermfg=105
hi clighter8TypeRef ctermfg=214
hi clighter8TemplateRef ctermfg=170
hi clighter8NamespaceRef ctermfg=64
hi clighter8MemberRef ctermfg=64
hi clighter8DeclRefExpr ctermfg=214
hi clighter8MemberRefExpr ctermfg=64
hi clighter8MacroInstantiation ctermfg=39
hi clighter8InclusionDirective ctermfg=111
" for HTML
let @h = "$v^xi<\<Esc>pA\<Space></\<Esc>pF<"
" copy paste using clipboard using xsel
let @p = ":read !xsel"
let @y = ":'<,'>w !xsel -i"

" the following is a mapping for copying a line in file and exec a command
" by passing it as an argument (here command is feh), disowning the executed
" command
map ff Vy:!feh <C-r>" & disown <Cr><Cr>
"nnoremap ff ^f#i\<esc>ya'u:!xlogo -bg <C-r>" & disown <Cr><Cr>
"
" vim fileexplorer
" % create a file
"
