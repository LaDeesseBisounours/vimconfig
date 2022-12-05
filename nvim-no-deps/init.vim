"Documented vimrc with some explanations
"remember ^n means Ctrl+n


filetype plugin indent on    " required
colorscheme torte

" Define the menu content with a Vim dictionary
function! ChooseTab()
    execute "tabs"
    echo "Enter number Tab "
    let c = nr2char(getchar())
    let d = ""
    while c =~ "[0-9]"
        echon c
        let d = d . c
        let c = nr2char(getchar())
    endwhile
    execute "tabn " . d
endfunction

function! ChooseBuffer()
    execute "ls"
    echo "Enter number buffer "
    let c = nr2char(getchar())
    let d = ""
    while c =~ "[0-9]"
        echon c
        let d = d . c
        let c = nr2char(getchar())
    endwhile
    execute "b " . d
endfunction

let mapleader = "\<Space>"


"------cscope------------------------------------------------------------------

"define :Maketags as running ctags -R .
"ctags allows to jump to definition of symbols inside projetc (IDE style)

""command! Maketags !cscope -R -b
"to jump to definition of a symbol ^]
"for ambiguous tag g ^]
"

"":set runtimepath+=~/.vim/bundle/cscope/cscope_maps.vim
""function! LoadCscope()
""  let db = findfile("cscope.out", ".;")
""  if (!empty(db))
""    let path = strpart(db, 0, match(db, "/cscope.out$"))
""    set nocscopeverbose " suppress 'duplicate connection' error
""    exe "cs add " . db . " " . path
""    set cscopeverbose
""  " else add the database pointed to by environment variable 
""  elseif $CSCOPE_DB != "" 
""    cs add $CSCOPE_DB
""  endif
""endfunction


""au BufEnter /* call LoadCscope()
"cscope set up
"Code and explanations https://vim.fandom.com/wiki/Cscope
" if has('cscope') 
"   set cscopetag cscopeverbose

"   if has('quickfix')
"     set cscopequickfix=s-,c-,d-,i-,t-,e-
"   endif

"   cnoreabbrev csa cs add
"   cnoreabbrev csf cs find
"   cnoreabbrev csk cs kill
"   cnoreabbrev csr cs reset
"   cnoreabbrev css cs show
"   cnoreabbrev csh cs help

"   command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
" endif

"-----configuration of standard settings---------------------------------------

"vim keeps track of jumps you made  ^o to go back and ^i to go forward

"autocomplete, documentation :help ins-completion
"(in insert mode)
"basic one ^n and ^p, they can be managed with variable completion
"just this file ^x ^n
"for filenames  ^x ^f
"using ctags    ^x ^]

set nocompatible "vim won t pretend to act like vi & required
filetype off     " required

"file browsing :help netrw-browse-maps
"also when cursor is on a filename gf will open the file


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


syntax enable "color highlight
set colorcolumn=80 " color 80th column to give coding style help
set number relativenumber " show relative line number
set tabstop=4 "sizeof tab = 4
set shiftwidth=4  "indent size
set expandtab     "when pressing tab adds spaces instead of tab
"set list  "show every special characters
set ruler
set wrap "one line on the screen is considered as one line for vim
"set textwidth=90        "fold text at 90
set virtualedit=all   "cursor can move outside of real text   
set clipboard=unnamed " default clipboard is OS clipboard
set splitbelow  " vs split right and not left
set splitright  " sp split down and not up
set hidden "allows for hidden buffers
"set makeprg=something   allows to set the action to do for compiling
":make to build your program
":cn :cp to go to next or previous error
":copen open a widow containing them all
"

""packadd termdebug
""hi debugPC ctermbg=red guibg=red
""hi debugBreakpoint ctermbg=blue guibg=blue
""hi Normal ctermbg=NONE guibg=NONE
""hi NonText ctermbg=NONE guibg=NONE  guifg=NONE ctermfg=NONE

"-----folding------------------------------------------------------------------
set foldmethod=syntax " fold every function by default
    "zo opens a fold at the cursor.
    "zO opens all folds at the cursor.
    "zc closes a fold under cursor. 
    "[z go to beginning of fold
    "]z got to end of fold



"-----imap---------------------------------------------------------------------

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
inoremap ''  '

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

"-----tmap---------------------------------------------------------------------

tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

"-----safety map to always move------------------------------------------------

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"-----nmap---------------------------------------------------------------------
"buffers
nnoremap <leader>bN :bprevious
nnoremap <leader>bc :bdelete
nnoremap <leader>bk :call ChooseBuffer()
nnoremap <leader>bl :ls
nnoremap <leader>bn :bnext

"tabs
nnoremap <leader>tN :tabp
nnoremap <leader>tc :tab close
nnoremap <leader>tk :call ChooseTab()
nnoremap <leader>tl :tabs
nnoremap <leader>tn :tabn
nnoremap <leader>to :tabnew

"windows
nnoremap <leader>w+ :resize +10
nnoremap <leader>w- :resize -10
nnoremap <leader>w< :10 wincmd <
nnoremap <leader>w= :wincmd =
nnoremap <leader>w> :10 wincmd >
nnoremap <leader>wH :wincmd H
nnoremap <leader>wJ :wincmd J
nnoremap <leader>wK :wincmd K
nnoremap <leader>wL :wincmd L
nnoremap <leader>wV :sp
nnoremap <leader>wc :wincmd c
nnoremap <leader>wh :wincmd h
nnoremap <leader>wj :wincmd j
nnoremap <leader>wk :wincmd k
nnoremap <leader>wl :wincmd l
nnoremap <leader>wv :vs
nnoremap <leader>w[ :wincmd H | vert res 30
nnoremap <leader>w] :wincmd L | vert res 30

"config
nnoremap <leader>cr :so $MYVIMRC
nnoremap <leader>ce :vs $MYVIMRC


"-----map----------------------------------------------------------------------

noremap <F11> :setlocal spell! spelllang=en_us<CR>
noremap <F12> :setlocal spell! spelllang=fr_FR<CR>
noremap <F9> :% !clang-format %

"-----cabrev-------------------------------------------------------------------

cnoreabbrev He vert h
cnoreabbrev lm lmake
cnoreabbrev lo lopen
cnoreabbrev lg lgrep -R '' *<left><left><left>

"-----macros-------------------------------------------------------------------

" for HTML
let @h = "\"tdiwi<\"tpla</\"tpF<i"

" the following is a mapping for copying a line in file and exec a command
" by it as an argument (here command is feh), disowning the executed
" command
"map ff Vy:!feh <C-r>" & disown <Cr><Cr>
"nnoremap ff ^f#i\<esc>ya'u:!xlogo -bg <C-r>" & disown <Cr><Cr>
