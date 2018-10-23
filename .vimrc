set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nacitar/terminalkeys.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/indentLine'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tpope/vim-speeddating'
"Plugin 'fatih/vim-go'
"Plugin 'scrooloose/nerdtree'
Plugin 'jceb/vim-orgmode'
Plugin 'mike-hearn/base16-vim-lightline'
"Plugin 'Lokaltog/powerline'
"Plugin 'benmills/vimux'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tpope/vim-dispatch'
"Plugin 'sjl/gundo.vim'
"Plugin 'vhdirk/vim-cmake'
"Plugin 'jalcine/cmake.vim'

call vundle#end()

" Colorscheme base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

" git commit
autocmd Filetype gitcommit setlocal spell textwidth=72

filetype plugin indent on

" Tab Settings
set tabstop=2
set shiftwidth=2
set expandtab

" Common Settings
set encoding=utf-8
set scrolloff=3
set autoindent
set shiftround
set smarttab
set showmode
set showcmd
set hidden
set wildmenu
"set termguicolors
set wildmode=list:longest
syntax enable

" folding settings
set foldmethod=marker
"set foldmarker={,}
set foldnestmax=5
set nofoldenable

" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set relativenumber
set number
"set norelativenumber

"Changing Leader Key
let mapleader = ","

" Enable Mouse
set mouse=a
set clipboard^=unnamedplus

" Reload .vimrc
augroup myvimrc
  au!
  au BufWritePost .vimrc,.gvimrc nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Sessions
set sessionoptions=buffers,curdir,options,resize,winsize
" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" <F7> restores that 'shutdown session'
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" If you really want to, this next line should restore the shutdown session 
" automatically, whenever you start vim.  (Commented out for now, in case 
" somebody just copy/pastes this whole block)
" 
" autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>

" manually save a session with <F5>
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>

" recall the manually saved session with <F6>
noremap <F6> :source ~/.vim/manual_session.vim<cr>

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
noremap ; :
nnoremap j gj
nnoremap k gk

" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Tab navigation like Firefox.
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" Tmux
let s:hidden_tmux = 0
function! ToggleHideTmux()
  if s:hidden_tmux == 0
    let s:hidden_tmux = 1
    execute "silent !tmux set status"
  else
    let s:hidden_tmux = 0
    execute "silent !tmux set status"
  endif
endfunction

function! ShowTmux()
  if s:hidden_tmux == 1
    let s:hidden_tmux = 0
    execute "silent !tmux set status"
  endif
endfunction

nnoremap <C-M-t> :call ToggleHideTmux()<CR>
autocmd VimLeave * :call ShowTmux()

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" To  show special characters in Vim
set list
set listchars=tab:▸-,trail:-,extends:>,precedes:<,nbsp:+

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <M-Left> <C-w>h
nnoremap <M-Down> <C-w>j
nnoremap <M-Up> <C-w>k
nnoremap <M-Right> <C-w>l

" Save with CTRL+S
inoremap <C-s> <C-o>:update<CR>
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap '; <ESC>
vnoremap '; <ESC>

" Redrawing
set lazyredraw
set ttyfast

" swaps and backups
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swap//

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
    "let base16colorspace=256
    "colorschem base16-phd
    "colorscheme solarized
    set listchars=tab:▸\ 
    set guiheadroom=0
    set switchbuf=useopen
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
    " Maximize gvim window.
    " set lines=999 columns=999
else
    "set t_Co=16
    "set background=dark
    "colorschem solarized
    "let base16colorspace=256
    "colorschem base16-phd
    highlight LineNr ctermfg=grey
endif

" ========== Plugin Settings =========="

" Netrw
nnoremap <leader>f :Explore<cr>
autocmd FileType netrw setl bufhidden=wipe
autocmd Filetype netrw nnoremap <buffer> <leader>f :Rex<cr>
let g:netrw_banner = 0

" Mapping to NERDTree
"nnoremap <leader>f :NERDTreeToggle<cr>
"let NERDTreeChDirMode = 2
"let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" NerdCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1

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

" Tagbar key bindings."
nmap <leader>o <ESC>:TagbarToggle<cr>
imap <leader>o <ESC>:TagbarToggle<cr>
nmap <leader>i <ESC>:TagbarOpen j<cr>
imap <leader>i <ESC>:TagbarOpen j<cr>



"YCM
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToImprecise<CR>
nnoremap <leader>y :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>h :YcmCompleter GetDocImprecise<CR>
let g:ycm_confirm_extra_conf = 0 "do not ask about .ycm_extra_conf
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf= ''
let g:ycm_rust_src_path = '/usr/local/share/code/rustc-1.18.0-src/src'

"Highlight/show errors and their location using the clang completer
let g:ycm_warning_symbol = 'w>'

"Ycm Experimental
let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1

"CMake options
"let g:cmake_c_compiler = 'gcc'
"let g:cmake_inject_flags.ycm = 0

" Syntastic options
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Gundo options
"nnoremap <F5> :GundoToggle<CR>

" Switch to alternate buffer
nnoremap <C-Right> :MBEbn<cr>
nnoremap <C-Left> :MBEbp<cr>

"Minibufexpl
"let g:miniBufExplVSplit = 30
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplBuffersNeeded = 0
nmap <leader>m :MBEToggle<cr>


" Window resize
if bufwinnr(1)
  map <C-w><Left> :vertical resize +10<CR>
  map <C-w><Right> :vertical resize -10<CR>
  map <C-w><Down> :res -5<CR>
  map <C-w><Up> :res +5<CR>
endif

" Printing
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function! DoMyPrint(args)
    let colorsave=g:colors_name
    color github
    exec 'hardcopy '.a:args
    exec 'color '.colorsave
endfunction

" Searching
" map <F4> :execute "vimgrep /<c-r><c-w>/j **/*.".expand("%:e") <Bar> cw<CR>


" fit quickfix window
au FileType qf call AdjustWindowHeight(7, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --vimgrep
  "set grepprg=ack\ -H\ --nocolor\ --nogroup
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:EasyGrepCommand=1
  let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepMode=0
  let g:EasyGrepFilesToExclude=""
endif

" EasyMotion
map <Leader>; <Plug>(easymotion-bd-jk)

" Lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': substitute(g:colors_name, "-", "_", "g"),
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction


function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" indentLine
"let g:indentLine_char = '⦙'
"let g:indentLine_char = '│'
let g:indentLine_concealcursor ='nc'
let g:indentLine_char = '┊'
:set fillchars+=vert:\ 

