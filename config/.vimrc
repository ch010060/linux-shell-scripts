set background=dark

filetype plugin on
syntax enable
"set number
set noruler
set ignorecase
set smartcase

"set cursorline
"set cursorcolumn

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

map <A-Left> <Esc>:b#<CR>
map <A-Right> <Esc>:bn<CR>
map <C-W> <Esc>:q<CR>

"------------Plugin: nerdtree------------
map <C-p> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Map Ctrl-Left & Ctrl-Right to switching tabs Ctrl-n to open new tab
 map <C-Left> <Esc>:tabprev<CR>
 map <C-Right> <Esc>:tabnext<CR>
 map <C-n> <Esc>:tabnew<CR>
 
" Shortcut
nnoremap <silent> <F5> :NERDTree<CR>