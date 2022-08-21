if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

:set number
:set relativenumber
:set softtabstop=4 shiftwidth=4 expandtab

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

syntax on

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

:colorscheme gruvbox
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

map <C-n> :NERDTreeToggle<CR>

let g:gruvbox_italic=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"airline setting 
let g:airline_powerline_fonts = 1

"Compile function
noremap r :call CompileRun()<CR>
function! CompileRun()
  execute "w"
  if &filetype == 'c'
    execute "!gcc % -o %<"
  elseif &filetype == 'cpp'
    execute "!g++ % -o %<"
  endif
endfunction

"heading
autocmd BufNewFile *.v,*.sv,*.cpp,*.c,*.h exec ":call Setfilehead()"
func Setfilehead()
    call append(0, '/***********************************************')
    call append(1, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(2, '***********************************************/')
    if &filetype =='cpp'
        call append(4,"#include<bits/stdc++.h>")
        call append(5,"using namespace std;")
    endif
endfunc
