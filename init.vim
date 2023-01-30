call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
" cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" snip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" nvim plug
Plug 'NTBBloodbath/rest.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'ahmedkhalf/project.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-tree.lua'

" icon
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" tele extension
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" golang
Plug 'vim-test/vim-test'
"Plug 'ray-x/go.nvim'
"Plug 'ray-x/guihua.lua'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" floatterm
Plug 'voldikss/vim-floaterm'

" startup
" Plug 'goolord/alpha-nvim'

Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript' , { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'kana/vim-arpeggio'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'terrortylor/nvim-comment'
Plug 'chrisbra/unicode.vim'
Plug 'mattn/emmet-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'kien/ctrlp.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-ui-select.nvim'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'windwp/nvim-ts-autotag'

" rust
Plug 'simrat39/rust-tools.nvim'

call plug#end()

" lua
lua require("dsy")
"autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
"autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync()

"ind files using Telescope command-line sugar.
nnoremap <space>tt <cmd>Telescope<cr>

nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>
nnoremap <space>ft <cmd>Telescope tags<cr>
nnoremap <space>fg <cmd>Telescope git_files<cr>
nnoremap <space>fo <cmd>Telescope oldfiles<cr>
nnoremap <space><space> <cmd>Telescope buffers<cr>
"nnoremap <space>ww <cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<cr>
"nnoremap <space>fd <cmd>Telescope file_browser cwd=~/coding<cr>
nnoremap <space>fn <cmd>Telescope find_files cwd=~/.config/nvim/<cr>
nnoremap <space>fc <cmd>Telescope find_files cwd=~/dotfile<cr>
nnoremap <space>fw <cmd>:Window<cr>

noremap <space>ss <cmd>Telescope live_grep<cr>
nnoremap <space>sw <cmd>Telescope grep_string<cr>

nnoremap <space>gr <cmd>Telescope lsp_references<cr>
nnoremap <space>gd <cmd>Telescope lsp_document_symbols<cr>

" rest
nnoremap <space>rh <Plug>RestNvim<cr>

" float
nnoremap <space>tf :FloatermNew<cr>



" Go to tab by number
noremap <Space>1 1gt
noremap <Space>2 2gt
noremap <Space>3 3gt
noremap <Space>4 4gt
noremap <Space>5 5gt
noremap <Space>6 6gt
noremap <Space>7 7gt
noremap <Space>8 8gt
noremap <Space>9 9gt
noremap <Space>0 :tablast<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <Leader>t     :tabnew .<CR>

map <Esc> <ESC>:noh<Cr>


"nnoremap <leader>fj <cmd>Telescope file_browser path=~<cr>
"nnoremap <leader>fk <cmd>Telescope find_files path=~<cr>

" treesitter
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

" markdown
let g:mkdp_browser = '/snap/bin/firefox'

let g:ruby_host_prog = '/usr/bin/ruby'

let g:user_emmet_mode='a'
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_install_global = 0
"let g:user_emmet_leader_key='<C-,>'

au FocusGained,BufEnter * :checktime
autocmd BufRead, BufWritePost *.java normal gg=G
autocmd FileType json autocmd BufRead, BufWritePost, BufWritePre normal :Jsonformat
autocmd BufNewFile,BufRead *.gohtml set filetype=html
"autocmd Filetype yaml,c,cpp,markdown,html,css,javascript,javascriptreact,arduino set ts=2 sw=2
autocmd FileType html,css,javascript,javascriptreact EmmetInstall
let g:jsx_ext_required = 1
" We bind it to <leader>e here, feel free to change this
"nmap <space>e :CocCommand explorer<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Dracu :colorscheme dracula 

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
autocmd FileType c command! -nargs=0 Rc :sp|:res -10|:term gcc %;./a.out
autocmd FileType cpp command! -nargs=0 Rc :sp|:res -10|:term g++ %;./a.out
autocmd FileType python command! -nargs=0 Rc :sp|:res -10|:term python3 % <cr>i
autocmd FileType go command! -nargs=0 Rc :sp|:res -10|:term go run % <cr>i
autocmd FileType ruby command! -nargs=0 Rc :sp|:res -10|:term ruby % <cr>i

" golang
let g:go_gopls_enabled=0
let g:go_def_mapping_enabled = 0
"autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua OrgImports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
"au filetype go inoremap <buffer> . .<C-x><C-o>

tnoremap <C-n> <C-\><C-n>
syntax  on
set mouse=a
set updatetime=500
"set cursorline
set ignorecase
set title
set relativenumber
nmap <F2> :set relativenumber!<cr>
nmap <F3> :set cursorline!<cr>
nmap <F4> :source ~/.config/nvim/init.vim<cr>
set encoding=utf-8
set fileencodings=utf-8
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
set wildmenu
set autoread
set autowrite
set formatoptions-=cro
filetype on
filetype plugin indent on

set path=$HOME/dotfile,$HOME/codes/*,$HOME/.config/nvim,$HOME,$HOME/codes/university_code/**,$HOME/.config/starship.toml,$HOME/.config/picom,$HOME/.config/dunst,$HOME/.config/polybar,$HOME/.i3,$HOME/.config/,
set path+=**

let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
"check |netrw-browse-map| for more mapping 

command MakeTags !ctags -R .
command -nargs=0 Jsonformat execute "%!python -m json.tool"
command -nargs=0 Xmlformat :%! tidy -xml -iq -

" update tags auto

function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction
"function! UpdateTags()
  "let f = expand("%:p")
  "let cwd = getcwd()
  "let tagfilename = cwd . "/tags"
  "let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  "call DelTagOfFile(f)
  "let resp = system(cmd)
"endfunction
"autocmd BufWritePost *.cpp,*.h,*.c,*.go,*.py call UpdateTags()

function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"set theme 
set termguicolors
colorscheme gruvbox
"let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_bold=0
let g:gruvbox_italic=1
set background=dark
highlight normal     ctermbg=none guibg=none
highlight SignColumn guibg=none ctermbg=none
set signcolumn=yes

"autocmd VimEnter * hi Normal ctermbg=none guibg=none
highlight LineNr     ctermfg=NONE guifg=NONE

"hide toolbars
if has("gui_running")
	set guioptions -=m
	set guioptions -=T
endif

"fugitive
nnoremap <Space>gg :vert G<CR>
"nnoremap <Space>gc :GCheckout<CR>
"nnoremap <Space>gb :GBranches<CR>
"noremap gh :diffget //3<CR>
"noremap gu :diffget //2<cr>
set diffopt+=vertical

"golden viewer
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
nmap <C-w>k :vs <cr>
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
"nnoremap <Leader>t :vs\|:ter<CR>
set splitbelow
set splitright


"map
"Easy Motion
let mapleader="\\"
let maplocalleader="\\"
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <Space>ef <plug>(easymotion-bd-f)
nmap <Space>ef <plug>(easymotion-overwin-f)

"autosave
nnoremap <Space>w :wa<CR>
"exis
nnoremap qq :qa 
nnoremap <Space>x :bd<CR> 
nnoremap <Space>q :q<CR> 

inoremap <C-c> <Esc>:noh<Cr>
noremap <Space>y "+y

" buffer
nnoremap <C-s><C-j> :bp<cr>
nnoremap <C-s><C-k> :bn<cr>
nnoremap <C-s><C-l> :ls<cr>:b
nnoremap <C-s><C-d> :w <bar> %bd <bar> e# <bar> bd# <CR>

noremap H ^
noremap L $

" nerdtree
"autocmd BufEnter * lcd %:p:h
set autochdir
nmap <space>ee :NvimTreeToggle<CR>



" fzf
"Empty value to disable preview window altogether
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" airline
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_extensions = ['branch', 'fugitiveline', 'fzf' ]
let g:airline#extensions#tabline#enabled = 0
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
"let g:airline_section_c = '%t'
"source ~/.config/nvim/statusline.vim


command -nargs=* -range GoAddTags call Gomodifytags(<line1>, <line2>, <count>, '-add-tags', <f-args>)

" https://www.sobyte.net/post/2022-01/vim-go-struct-tag/
function Gomodifytags(s,e,c,cmd,...)
        let path = expand('%p')
        if a:c < 0
                execute 'normal va{^['
                let range = line("'<").",".line("'>")
        else
                let range = a:s.",".a:e
        end
		for i in a:000
			call system('gomodifytags '.a:cmd.' '.i.' -file '.path.' -line '.range.' -w '.join(a:000, ' '))
		endfor
		 execute "e "
endfunction

