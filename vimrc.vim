" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" Appearance
Plug 'vim-airline/vim-airline'                  " Status bar
Plug 'vim-airline/vim-airline-themes'           " Themes for vim-airline
Plug 'morhetz/gruvbox'                          " Color scheme
Plug 'ryanoasis/vim-devicons'                   " Icons for Nerdtree

" Utilities
Plug 'tpope/vim-fugitive'                       " Git wrapper
Plug 'tpope/vim-surround'                       " quoting/parenthesizing made simple
Plug 'scrooloose/nerdtree'                      " File explorer
Plug 'scrooloose/nerdcommenter'                 " Commenting made simple
Plug 'jiangmiao/auto-pairs'                     " Insert or delete brackets, parens, quotes in pair
Plug 'yggdroot/indentline'                      " Show indent lines
Plug 'ctrlpvim/ctrlp.vim'                       " Fuzzy file, buffer, mru, tag, etc finder'

" Completion / Linter / Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
"Plug 'github/copilot.vim'                       " Copilot
Plug 'psf/black', { 'branch': 'stable' }



call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

set nocompatible                " disable compatibility to old-time vi
set encoding=utf-8              " set encoding to utf-8
set termencoding=utf-8          " set terminal encoding to utf-8
set t_Co=256                    " set terminal colors to 256
set showmatch                   " show matching 
set ignorecase                  " case insensitive 
set hlsearch                    " highlight search 
set incsearch                   " incremental search
set tabstop=4                   " number of columns occupied by a tab 
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                   " converts tabs to white space
set shiftwidth=4                " width for autoindents
set autoindent                  " indent a new line the same amount as the line just typed
set number                      " add line numbers
set cursorline                  " highlight current cursorline
set ttyfast                     " Speed up scrolling in Vim
set noswapfile                  " disable creating swap file
set nobackup                    " disable creating backup file
set nowritebackup               " disable creating backup file
set backspace=indent,eol,start  " Make backspace work as you would expect.
set hidden                      " Switch between buffers without having to save first.
set splitbelow                  " Open new windows below the current window.
set splitright                  " Open new windows right of the current window.
set updatetime=300              " Set the time to wait for a mapped sequence to complete.
set background=dark             " Set the background to dark
filetype plugin indent on       " allow auto-indenting depending on file type
filetype plugin on
syntax on                       " syntax highlighting

" Keyboard Mappings
let mapleader = ","

" 새로운 버퍼를 생성하고 이동
nnoremap <leader>bt :enew<CR>

" 다음 버퍼로 이동
nnoremap <leader>bl :bnext<CR>

" 이전 버퍼로 이동
nnoremap <leader>bh :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nnoremap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nnoremap <Leader>bs :ls<CR>:b<Space>

" 터미널 열기
" nnoremap <leader>t :term<CR>
nnoremap <leader>t :sp<CR>:term<CR>


" 저장
nnoremap <leader>s :w<CR>
inoremap <leader>s <ESC>:w<CR>

colorscheme gruvbox

" Configuration
autocmd FileType python source $HOME/.vim/ftplugin/python.vim
source $HOME/.vim/ftplugin/coc.vim
source $HOME/.vim/ftplugin/nerdcommenter.vim

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' 
let g:airline#extensions#tabline#fnamemod = ':t' " 파일명만 출력

" Auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-b>'

" Indentline
" Change Character Color
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_bgcolor_term = 202
" Change Indent Char
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" MiniMap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" NERDTree
" 특정 파일 없이 vim을 열 때 자동으로 실행
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 디렉토리에서 시작할 때 자동으로 실행 (폴더 열기 기능)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Ctrl+n 단축키로 열고 닫기
" map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" 창이 nerdtree만 남을경우 자동 닫기
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 폴더 열림 닫힘 표시
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden = 1

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
