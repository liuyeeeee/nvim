if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

:set number
:set relativenumber
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

call plug#end()

:colorscheme gruvbox

map <C-n> :NERDTreeToggle<CR>

let g:gruvbox_italic=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Compile function
noremap r :call CompileRun()<CR>
function! CompileRun()
  execute "w"
  if &filetype == 'c'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!gcc % -o build/%<"
    execute "!time ./build/%<"
  elseif &filetype == 'cpp'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!g++ % -o build/%<"
    execute "!time ./build/%<"
  endif
endfunction

"heading
autocmd BufNewFile *.v,*.sv,*.cpp,*.c,*.h exec ":call Setfilehead()"
func Setfilehead()
    call append(0, '/***********************************************')
    call append(1, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(2, '***********************************************/')
endfunc
