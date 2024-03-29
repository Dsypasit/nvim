call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" generative ai
" Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'ray-x/lsp_signature.nvim'
"
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
" Plug 'Shatur/neovim-session-manager'
" Plug 'ahmedkhalf/project.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/which-key.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'windwp/nvim-spectre'
Plug 'cljoly/telescope-repo.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'sindrets/diffview.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'edluffy/hologram.nvim'

" nvim-tree
Plug 'nvim-tree/nvim-tree.lua'

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
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
" Plug 'giusgad/pets.nvim'

" theme
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'ayu-theme/ayu-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Plug 'ggandor/leap.nvim'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-surround'
Plug 'kana/vim-arpeggio'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'terrortylor/nvim-comment'
Plug 'chrisbra/unicode.vim'
Plug 'mattn/emmet-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'kshenoy/vim-signature'
" Plug 'toppair/reach.nvim'
Plug 'lilydjwg/colorizer'
Plug 'arturgoms/moonbow.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'sainnhe/gruvbox-material'

" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'airblade/vim-rooter'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'windwp/nvim-ts-autotag'

" rust
Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'

Plug 'chipsenkbeil/distant.nvim'

call plug#end()

set termguicolors
" lua
lua require("dsy")
"autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()
"autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync()

"ind files using Telescope command-line sugar.
nnoremap <space>tt <cmd>Telescope<cr>

let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fm <cmd>Telescope marks<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>
nnoremap <space>ft <cmd>Telescope tags<cr>
nnoremap <space>fg <cmd>Telescope git_files<cr>
nnoremap <space>fo <cmd>Telescope oldfiles<cr>
nnoremap <space><space> <cmd>Telescope buffers<cr>
" nnoremap <space>fp <cmd>lua require'telescope'.extensions.projects.projects{}<cr>
nnoremap <space>fd <cmd>Telescope file_browser cwd=~/code<cr>
nnoremap <space>fl <cmd>LazyGit<cr>

noremap <space>ss <cmd>Telescope live_grep<cr>
nnoremap <space>sw <cmd>Telescope grep_string<cr>

nnoremap <space>gr <cmd>Telescope lsp_references<cr>
nnoremap <space>gd <cmd>Telescope lsp_document_symbols<cr>

nnoremap <C-p> <cmd>Telescope repo list<cr>

nmap <space>ma <cmd>:lua require("harpoon.mark").add_file()<cr>
nmap <space>mm <cmd>:lua require("harpoon.ui").toggle_quick_menu()<cr>
nmap <C-s><C-j> <cmd>:lua require("harpoon.ui").nav_prev()<cr>
nmap <C-s><C-k> <cmd>:lua require("harpoon.ui").nav_next()<cr>
nmap <space>m1 <cmd>:lua require("harpoon.ui").nav_file(1)<cr>
nmap <space>m2 <cmd>:lua require("harpoon.ui").nav_file(2)<cr>
nmap <space>m3 <cmd>:lua require("harpoon.ui").nav_file(3)<cr>
nmap ' `

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

" markdown
" let g:mkdp_browser = '/snap/bin/firefox'

let g:ruby_host_prog = '/usr/bin/ruby'

let g:user_emmet_mode='a'
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_install_global = 0
"let g:user_emmet_leader_key='<C-,>'

au FocusGained,BufEnter * :checktime
autocmd BufRead, BufWritePost *.java normal gg=G
autocmd FileType json autocmd BufRead, BufWritePost, BufWritePre normal :Jsonformat
autocmd BufNewFile,BufRead *.gohtml set filetype=html
autocmd Filetype prisma,typescript, typescriptreact,c,cpp,markdown,html,css,javascript,javascriptreact,arduino,js set ts=2 sw=2
" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

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
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua OrgImports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
"au filetype go inoremap <buffer> . .<C-x><C-o>
"
" rust
let g:rustfmt_autosave = 1

tnoremap <C-n> <C-\><C-n>
syntax  on
set undofile
set mouse=a
set updatetime=500
"set cursorline
set ignorecase
set title
set relativenumber
nmap <F2> :set relativenumber!<cr>
set autoindent
nmap <F3> :set cursorline!<cr>
nmap <F4> :source ~/.config/nvim/init.vim<cr>
set encoding=utf-8
set fileencodings=utf-8
set visualbell
set shiftwidth=4
set hidden
set tabstop=4
set expandtab
set smarttab
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
" set colorcolumn=80
filetype on
filetype plugin indent on

set path=$HOME/dotfile,$HOME/codes/*,$HOME/.config/nvim,$HOME,$HOME/codes/university_code/**,$HOME/.config/starship.toml,$HOME/.config/picom,$HOME/.config/dunst,$HOME/.config/polybar,$HOME/.i3,$HOME/.config/,
set path+=**

" let g:netrw_browse_split=4
" let g:netrw_altv=1
" let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()
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
"

set background=dark
" gruvbox-mat
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_transparent_background = 2
" let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_ui_contrast = 'high'

"set theme 
set termguicolors
colorscheme gruvbox-material
" colorscheme ayu
"let g:gruvbox_transparent_bg=1


" gruvbox-ori
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_bold=1
let g:gruvbox_italic=1
set signcolumn=yes
highlight normal     ctermbg=none guibg=none
highlight SignColumn guibg=none ctermbg=none
highlight LineNr     ctermfg=NONE guifg=NONE
hi SignatureMarkText ctermbg=none guibg=none

augroup transparent_signs
  au!
  autocmd ColorScheme * highlight SignColumn guibg=NONE
augroup END

"autocmd VimEnter * hi Normal ctermbg=none guibg=none

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
" nnoremap <C-s><C-j> :bn<cr>
" nnoremap <C-s><C-k> :bp<cr>
" nnoremap <C-s><C-l> :ls<cr>:b
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
" let g:airline_theme='base16_gruvbox_dark_hard'
" let g:airline_extensions = ['branch', 'fugitiveline', 'fzf' ]
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_highlighting_cache = 1
" let g:airline_powerline_fonts = 1
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

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
nnoremap <Leader>g :silent lgrep<Space>
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>
set grepformat+=%f:%l:%c:%m
"
" function DisableSyntaxTreesitter()
"     if exists(':TSBufDisable')
"         exec 'TSBufDisable autotag'
"         exec 'TSBufDisable highlight'
"         exec 'TSBufDisable incremental_selection'
"         exec 'TSBufDisable indent'
"         exec 'TSBufDisable playground'
"         exec 'TSBufDisable query_linter'
"         exec 'TSBufDisable rainbow'
"         exec 'TSBufDisable refactor.highlight_definitions'
"         exec 'TSBufDisable refactor.navigation'
"         exec 'TSBufDisable refactor.smart_rename'
"         exec 'TSBufDisable refactor.highlight_current_scope'
"         exec 'TSBufDisable textobjects.swap'
"         " exec 'TSBufDisable textobjects.move'
"         exec 'TSBufDisable textobjects.lsp_interop'
"         exec 'TSBufDisable textobjects.select'
"         exec ''
"     endif
"
"     set foldmethod=manual
"     syntax off
"     filetype off
"     set noundofile
"     set noswapfile
"     set noloadplugins
" endfunction
"
" augroup BigFileDisable
"     autocmd!
"     autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 512 * 1024 | exec DisableSyntaxTreesitter() | endif
" augroup END
