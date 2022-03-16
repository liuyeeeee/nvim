
:set number
:set relativenumber

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

:colorscheme gruvbox

map <C-n> :NERDTreeToggle<CR>

let g:airline_statusline_ontop = 1
let g:airline_powerline_fonts = 1
let g:gruvbox_italic=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
