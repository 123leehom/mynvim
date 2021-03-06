" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: xulihong
" Blog: https://ershidai.github.io/
" Github: https://github.com/123leehom

let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set noexpandtab
set autoindent
set list " 行尾空格显示
set wrap " 换行
set showcmd
set wildmenu
set hlsearch " 搜索高亮
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set listchars=tab:\|\ ,trail:▫
set scrolloff=6
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set tw=0
set mouse=a
set magic
set encoding=utf-8
set nobackup
set ruler 
set autoread
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast
set lazyredraw
set visualbell
set colorcolumn=100
set updatetime=1000
set virtualedit=block

" search up down clean
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

" quit write
map s <nop>
map <c-s> :w<CR>
map <c-q> :q<CR>
map Q :q!<CR>
map X :x<CR>
map J 5j
map K 5k
map H 5h
map L 5l
nmap ; :
nmap q :q<CR>

" split
map sn :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" tabe
map tn :tabe<CR>
map tj :-tabnext<CR>
map tk :+tabnext<CR>


" copy
vnoremap Y "+y


" plug
call plug#begin('~/.config/nvim/plugged')
" beautify
Plug 'theniceboy/eleline.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'dracula/vim'
Plug 'mg979/vim-xtabline'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'mhinz/vim-startify'
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'ryanoasis/vim-devicons'
" highlight
Plug 'RRethy/vim-illuminate'
" code
Plug 'Chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yggdroot/indentline'
let g:intdent_guides_guide_size = 1 " 指定对齐线的尺寸
let g:intdent_guides_start_level = 2 " 从第二层可视化显示缩进
Plug 'wellle/tmux-complete.vim'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
" tree
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
" Git
Plug 'airblade/vim-gitgutter'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Taglist
Plug 'liuchengxu/vista.vim'
call plug#end()


" xtabline
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1

" rainbow
let g:rainbow_active = 1

" Undotree
noremap <c-l> :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" NERDtree
let g:NERDtreeWinSize = 25
let NERDtreeShowBookmarks=1
let g:NERDtreeShowLineNumber=1
let NERDtreeMinimalUI = 1
let NERDtreeDirArrows = 1
nnoremap tt :NERDTreeToggle<CR>

" Vista.vim
"noremap V :Vista coc<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" code format
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" eleline.vim
" let g:airline_powerline_fonts = 0

" code run
noremap <c-r> :call RunCode()<CR>
func! RunCode()
	exec "w"
	if &filetype=='python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	elseif &filetype == 'php'
		set splitbelow
		:sp
		:term php %
	endif
endfunc

" GitGutter
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <c-g> :GitGutterFold<CR>
" nnoremap G :GitGutterPreviewHunk<CR>

" coc set
let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-css',
			\ 'coc-phpls',
			\ 'coc-diagnostic',
			\ 'coc-explorer',
			\ 'coc-flutter-tools',
			\ 'coc-gitignore',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-pyright',
			\ 'coc-python',
			\ 'coc-snippets',
			\ 'coc-sourcekit',
			\ 'coc-syntax',
			\ 'coc-tasks',
			\ 'coc-todolist',
			\ 'coc-translator',
			\ 'coc-tslint-plugin',
			\ 'coc-tsserver',
			\ 'coc-vimlsp',
			\ 'coc-vetur',
			\ 'coc-yaml',
			\ 'coc-yank']

set hidden
set updatetime=100
set shortmess+=c

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-p> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-illuminate
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" theme
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color dracula
" hi NonText ctermfg=gray guifg=grey10
let g:SnazzyTransparent = 1
color snazzy
