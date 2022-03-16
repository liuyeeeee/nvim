:set number
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()
:colorscheme gruvbox
map <C-n> :NERDTreeToggle<CR>
let g:gruvbox_italic=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
