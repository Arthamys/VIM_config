filetype off
let no_buffers_menu = 1
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  "     " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
let mapleader=","


" vim-plug plugins list
call plug#begin()

"Plug 'jez/vim-superman'
"Plug 'lervag/vimtex'
"Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
"Plug 'mattn/emmet-vim'

" Moving around
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'wellle/targets.vim'
 Plug 'easymotion/vim-easymotion'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Version control
"Plug 'airblade/vim-gitgutter'
"Plug 'rhysd/committia.vim'

" General code utility
Plug 'bronson/vim-trailing-whitespace'
" Plug 'ervandew/supertab'
"Plug 'raimondi/delimitMate'
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'tomtom/tcomment_vim' " TODO: go back to nerdcommenter !
" Plug 'tmhedberg/SimpylFold'
"Plug 'rking/ag.vim' " With cheatsheet
" Plug 'lilydjwg/colorizer'
" Plug 'stephpy/vim-yaml'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" C++
"Plug 'octol/vim-cpp-enhanced-highlight'

" " Python
" Plug 'klen/python-mode', { 'for': ['python'] }
" Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
" Plug 'nvie/vim-flake8'
" Plug 'benekastah/neomake'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'natw/vim-pythontextobj'

" C
"Plug 'Mizuchi/STL-Syntax'

" Colorschmes
Plug 'junegunn/seoul256.vim'
"Plug 'crusoexia/vim-monokai'
"Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'nanotech/jellybeans.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'jnurmine/Zenburn'
" Plug 'fmoralesc/molokayo'
" Plug 'wellsjo/wellsokai.vim'
" Plug 'chriskempson/tomorrow-theme'
" Plug 'altercation/vim-colors-solarized'

" Tags Creation
"Plug 'universal-ctags/ctags'
"Plug 'xolox/vim-easytags'
" dependency for easytags
"Plug 'xolox/vim-misc'

call plug#end()

filetype plugin indent on

" - PLUGINS OPTIONS
" Neomake
" TODO: Change it to work everytime you change the file
" autocmd BufEnter,VimEnter * Neomake
" autocmd BufWrite,InsertLeave * Neomake

" Jedi-Vim Options :
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#show_call_signatures = "2"

" C++ Syntax Highlighting options
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_concepts_highlight = 1

"let g:easytags_suppress_ctags_warning = 1
"let g:easytags_include_members = 1

" SuperTab
" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"

" UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"

" GitGutter
"let g:gitgutter_realtime = 500
"let g:gitgutter_updatetime = 500
"let g:gitgutter_eager = 500

" UltiSnips
" set runtimepath+=~/.nvim/ftdetect

" Pymode
"let g:pymode_rope = 0
"let g:pymode_virtualenv = 1

" Epitech
"let g:epi_login = 'engueh_a'
"let g:epi_name = 'Enguehard Galiee'
"nmap <leader>h :EpiHeader<CR>
"autocmd BufNewFile,BufRead *.h set filetype=cpp

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0


" - CONFIG OPTIONS
"<EOL> formatting
set fileformats=unix,dos,mac

"Automatically reload files edited outside of vim
set autoread

"" .swp files configuration
set nobackup
set noswapfile

"search options
set hlsearch
set incsearch
set smartcase
set showmatch

"indentation options
set autoindent smartindent
set smarttab
set tabstop=8
set shiftwidth=2
set softtabstop=2
set noexpandtab
set listchars=tab:>.


set backspace=eol,start,indent

" Disable visualbell
set visualbell t_vb=


function! ProtectedHeader()
  " '%' is the filename relative to the current directory, 
  " t is used to don't have the full path and only the filename
  let filename=expand('%:t')
  let splitted=split(filename, '\.')
  if len(splitted) != 2
    return
  endif
  let splitted[0]=toupper(splitted[0])
  let splitted[1]=toupper(splitted[1])
  echo "#ifndef " . splitted[0] . "_" . splitted[1] . "_"
  echo "# define " . splitted[0] . '_' . splitted[1] . '_'
  echo ""
  echo "#endif /* !" . splitted[0] . '_' . splitted[1] . "_ */"
endfunction

" Function for GNU style indentation
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1)}
  setlocal shiftwidth=2
  setlocal tabstop=8
endfunction

"au FileType c,h call GnuIndent()

"autocmd BufNewFile		*.{c,h} call GnuIndent()
"autocmd BufWritePre		*.{c,h} call GnuIndent()

set splitright

set clipboard=unnamedplus
set mouse-=a
set hidden
set nofoldenable

"Automatically apply changes to .vimrc
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" - PYTHON RELATED
" let python_highlight_all = 1
" set makeprg=python\ $*

" " Launch the current buffer in IPython
" function! IpythonMagic()
"	vsp
"	terminal ipython % --TerminalIPythonApp.force_interact=True
" endfunction
" nnoremap <leader>o :call IpythonMagic()<CR>

" - STYLING
colorscheme seoul256
syntax enable

"Minimum of lines for scoll offset
set scrolloff=5
set ruler
set number
set cursorline
set colorcolumn=80
set list
set relativenumber

set iskeyword-=_

hi Normal ctermbg=234
hi MatchParen cterm=bold ctermfg=red
highlight CursorLine ctermbg=237

" - MAPPINGS
inoremap <Up>		<NOP>
inoremap <Down>		<NOP>
inoremap <Left>		<NOP>
inoremap <Right>	<NOP>
noremap  <Up>		<NOP>
noremap  <Down>		<NOP>
noremap  <Left>		<NOP>
noremap  <Right>	<NOP>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

vnoremap \ss y/<C-R>"<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Move visual block || Might need a plug-in, this is kinda shitty
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Close buffer without closing the split
nnoremap <Leader>d :bp\|bd #<CR>

" PLUGINS MAPPINGS
nnoremap <Leader>p :CtrlP<CR>
" nnoremap  <F2> :NERDTreeToggle<CR>
"map <C-e> ;NERDTreeToggle<CR>

nnoremap <F9> :make<CR>
" Apply YCM FixIt
noremap <Leader>f :YcmCompleter FixIt<CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_include_dirs = [ '../includes', 'includes', 'include', '../include' ]

" Ultisnips variables
"let g:UltiSnipsExpandTrigger="<c-space>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nnoremap <Leader>q :bp<CR>
nnoremap <Leader>w :bn<CR>
nnoremap <Leader>l :ls<CR>:b<space>
"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


"*****************************************************************************
"" Functions
"*****************************************************************************
" Header insert function (from Morty) {
" Don't forget to set env variable EPI_NAME and EPI_LOGIN

function! EPIConfig(task)
    if a:task == "set"
	if expand("%") == "Makefile"
	    execute "0read ~/.vim/headers/makefile"
	elseif expand("%:e") == "h"
	    execute "0read ~/.vim/headers/h"
	elseif expand("%:e") == "c"
	    execute "0read ~/.vim/headers/c"
	elseif expand("%:e") == "hpp"
        execute "0read ~/.vim/headers/e"
	elseif expand("%:e") == "s"
        execute "0read ~/.vim/headers/s"
	endif
	execute "%substitute,$FILE," . expand("%") . ",e"
	execute "%substitute,$FN," . '\U' . expand("%:t:r") . ",e"
	execute "%substitute,$FLDR," . expand("%:p:h:t") . ",e"
	execute "%substitute,$PATH," . expand("%:p:h") . ",e"
	execute "%substitute,$PROJ," . $PROJECT . ",e"
	execute "%substitute,$NAME," . $EPI_NAME . ",e"
	execute "%substitute,$NICK," . $EPI_LOGIN . ",e"
	execute "%substitute,$DATE," . strftime("%a %b %d %H:%M:%S %Y") . ",e"
	call EPIConfig("update")
	normal Go
    elseif a:task == "update"
	let cursor = getpos(".")
        execute "%substitute,Last update.*,Last update " . strftime("%a %b %d %H:%M:%S %Y") . " " . $EPI_NAME . ",e"
	call setpos(".", cursor)
    endif
endfunction
autocmd! BufNewFile		*.{c,h,hpp},Makefile	call EPIConfig("set")
autocmd! BufWritePre		*.{c,h,hpp},Makefile	call EPIConfig("update")
" }

