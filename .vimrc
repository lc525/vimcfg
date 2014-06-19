set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/vundle'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'Syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Lokaltog/powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nacitar/terminalkeys.vim'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'sjl/gundo.vim'
"Plugin 'Townk/vim-autoclose'
"Plugin 'vhdirk/vim-cmake'
"Plugin 'jalcine/cmake.vim'

call vundle#end()

" Tab bg color
hi TabLineFill term=bold cterm=bold ctermbg=0

" Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" autocmd VimEnter * MiniBufExplorer

filetype plugin indent on

" Tab Settings
set tabstop=2
set shiftwidth=2
set expandtab

" Common Settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
syntax on

" folding settings
set foldmethod=marker
set foldmarker={,}
set foldnestmax=5
set nofoldenable

" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" set relativenumber
set number
set norelativenumber

"Changing Leader Key
let mapleader = ","

" Enable Mouse
" set mouse=a
set clipboard=unnamedplus

" Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" To  show special characters in Vim
set list
set listchars=tab:▸-

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

" Save with CTRL+S
inoremap <C-s> <C-o>:update<CR>
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap '; <ESC>
vnoremap '; <ESC>

" Switch to alternate tab
"map <C-t> :tab split<CR>
"imap <S-Tab> <Esc>gt
"map <S-Tab> gt

" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.20t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    colo molokai
    set listchars=tab:▸\ 
    set guiheadroom=0
    set switchbuf=useopen
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
    " Maximize gvim window.
    " set lines=999 columns=999
else
    set t_Co=256
    colorschem molokai
endif

" ========== Plugin Settings =========="

" Mapping to NERDTree
nnoremap <leader>f :NERDTreeToggle<cr>
let NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" Fugitive
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gd :Gdiff<cr>
autocmd User Fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" CtrlP
nnoremap <leader>t :CtrlPMixed<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_open_multiple_files = '1hr'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_clear_cache_on_exit = 0


" Mini Buffer some settigns."
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Tagbar key bindings."
nmap <leader>o <ESC>:TagbarToggle<cr>
imap <leader>o <ESC>:TagbarToggle<cr>


"YCM
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf = 0 "do not ask about .ycm_extra_conf
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_show_diagnostics_ui = 0

"CMake options
"let g:cmake_c_compiler = 'gcc'
"let g:cmake_inject_flags.ycm = 0

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Gundo options
nnoremap <F5> :GundoToggle<CR>

" Switch to alternate buffer
nnoremap <C-Right> :MBEbn<cr>
nnoremap <C-Left> :MBEbp<cr>


" Window resize
if bufwinnr(1)
  map <C-w><Left> :vertical resize +10<CR>
  map <C-w><Right> :vertical resize -10<CR>
  map <C-w><Down> :res -5<CR>
  map <C-w><Up> :res +5<CR>
endif

" Printing
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function DoMyPrint(args)
    let colorsave=g:colors_name
    color github
    exec 'hardcopy '.a:args
    exec 'color '.colorsave
endfunction

