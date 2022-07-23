let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
	Plug 'junegunn/vim-plug'
	Plug 'SirVer/ultisnips'
call plug#end()

let g:UltiSnipsExpandTrigger = '<Enter>'
let g:UltiSnipsJumpForwardTrigger = '<Down>'
let g:UltiSnipsJumpBackwardTrigger = '<Up>'
let g:UltiSnipsSnippetDirectories=['ultisnips']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
filetype on
filetype indent on
filetype plugin on
syntax on
set shiftwidth=4
set tabstop=4
set number
set cursorline
set cursorcolumn
set wildmenu

function! Run()
	if expand("%:e") ==? "cpp"
		:!g++ -Wall -Wextra -pedantic -std=c++2a -Wshadow -Ofast -o "%:r" "%:p"
	elseif expand("%:e") ==? "tex"
		:!pdflatex -shell-escape "%:p" 
	elseif expand("%:e") ==? "py"
		:!python3 "%:p"
	elseif expand("%:e") ==? "ml"
		:!ocamlc -o "%:r" 
	else
		echom "CANNOT RUN; UNKNOWN FILETYPE"
	endif
endfunction

function! Xc()
	if expand("%:e") ==? "cpp" || expand("%:e") ==? "ml"
		:!./"%:r" 
":!./%<
	elseif expand("%:e") ==? "tex"
		:!chrome "%:r.pdf" 
	else
		:call Run()
	endif
endfunction

nnoremap :@ :call Run()
nnoremap :!@# :call Run()
nnoremap :@@ :call Xc()
nnoremap :#@! :call Xc()
" map something to 213

colorscheme desert256

hi Normal guibg=NONE ctermbg=NONE
