:set number
:set hidden
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set mouse=a
:set encoding=UTF-8
:set backspace=indent,eol,start
nnoremap <esc><esc> :noh<return><esc>

nnoremap tn :tabnew<CR>
nnoremap <S-Tab> :tabnext<CR>
nnoremap <leader>T :tabprev<CR>

call plug#begin()

" General Behavior, Display and Themeing Plugs
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linter
Plug 'dense-analysis/ale'

" CSS Plugs
Plug 'ap/vim-css-color'

" Ruby / Rails Plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

call plug#end()

" No Arrow Keys
noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>

" Closetag Config
let g:closetag_filenames = '*.html,*.html.erb'

" Color Scheme Config
if has('termguicolors')
	set termguicolors
endif
let g:sonokai_style = 'shusia'
let g:sonokai_better_performance = 1
colorscheme sonokai
let g:airline_theme = 'sonokai'

" Easy Pane Change
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" NERDTree Setup
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

" FZF Fuzzy Search
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" ALE Config
" linters
let g:ale_linters = {
\ 'html': ['prettier'],
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop', 'solargraph']
\}
" fixers
let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['prettier', 'eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_ruby_solargraph_executable = 'solargraph'
let g:ale_ruby_solargraph_options = {}
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert
