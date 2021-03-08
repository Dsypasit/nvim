call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'kana/vim-arpeggio'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'vifm/vifm.vim'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'chrisbra/unicode.vim'
call plug#end()


syntax  on
set autochdir
set relativenumber
set encoding=utf8
set visualbell
set shiftwidth=4
set hidden
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set t_Co=256
set noswapfile
set nobackup
set nowritebackup
filetype plugin indent on

"set python
command -nargs=0 Jsonformat execute "%!python -m json.tool"

"set theme 
set termguicolors
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox 
set background=dark

"hide toolbars
if has("gui_running")
	set guioptions -=m
	set guioptions -=T
endif

"fugitive
nnoremap <Space>g :vert G<CR>
nnoremap <Space>gc :GCheckout<CR>
nnoremap <Space>gb :GBranches<CR>
noremap gh :diffget //3<CR>
noremap gu :diffget //2<cr>

" vifm
nmap <Space>vv :EditVifm<CR>
nmap <Space><Space>v :VsplitVifm<CR>
nmap <Space><Space>s :SplitVifm<CR>
nmap <Space>dv :DiffVifm<CR>
nmap <Space><Space>t :TabVifm<CR>
let g:vifm_repalce_netrw = 1
let g:vifm_replace_netrw_cmd = "Vifm"
let g:vifm_embed_split = 1


"golden viewer
set autoread
set noerrorbells
set novisualbell
set tm=500
set encoding=utf-8
set number
set nocp

"set arpeggio
call arpeggio#load()	
Arpeggio inoremap jk <Esc>
Arpeggio noremap jk <Esc>
Arpeggio inoremap ef <BS>
Arpeggio inoremap ij <Del>


"split

nmap <C-w>j :sp <cr>
nmap <C-w>l :vs <cr>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Space>j :wincmd j<CR>
nnoremap <Space>k :wincmd k<CR>
nnoremap <Space>l :wincmd l<CR>
nnoremap <Space>h :wincmd h<CR>
nnoremap <C-j> <C-w>J
nnoremap <C-k> <C-w>K
nnoremap <C-l> <C-w>L
nnoremap <C-h> <C-w>H
nnoremap <Leader>t :vs\|:ter<CR>
set splitbelow
set splitright


"map
"Easy Motion
let mapleader="\\"
nnoremap cd :cd %:h <CR>
nnoremap <Space>s :Lines<CR>
map <C-p> :set invpaste<CR>

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <Space>f <plug>(easymotion-bd-f)
nmap <Space>f <plug>(easymotion-overwin-f)

"Nerdtree
map <Leader>n :NERDTreeToggle<CR>

"autosave
nnoremap <Space>w :w<CR>
"exis
nnoremap qq :qa 
nnoremap <Space>q :q<CR> 


noremap H ^
noremap L $

" fzf
nnoremap <Space>b :Buffers<cr>
"Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" airline
let g:airline_theme='gruvbox'
let g:airline_extensions = []
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
" remove unused modes
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=0
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"


"nerdcommenter

map <C-_> <plug>NERDCommenterToggle

"" Create default mappings
let g:NERDCreateDefaultMappings = 0
"
"" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1
"
"" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
"" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'
"
"" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1
"
"" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
"" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1
"
"" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1
"
"" Enable NERDCommenterToggle to check all selected lines is commented or not
"


"coc
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

