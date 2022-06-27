call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Use release branch (recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" lsp
Plug 'neovim/nvim-lspconfig'
" cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" snip
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" nerdtree
Plug 'preservim/nerdtree'

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
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'chrisbra/unicode.vim'
Plug 'mattn/emmet-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" lua
lua require('lsp_config')
lua require('cmp_config')
lua require("tree")
lua require("tele")
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()

"Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope tags<cr>
nnoremap <leader>gg <cmd>Telescope git_files<cr>

" markdown
let g:mkdp_browser = '/usr/bin/firefox'

let g:ruby_host_prog = '/usr/bin/ruby'

let g:user_emmet_mode='a'
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

au FocusGained,BufEnter * :checktime
autocmd BufRead, BufWritePost *.java normal gg=G
autocmd FileType json autocmd BufRead, BufWritePost, BufWritePre normal :Jsonformat
autocmd Filetype yaml,markdown,html,css,javascript,javascriptreact,arduino set ts=2 sw=2 expandtab
autocmd FileType html,css,javascript,javascriptreact EmmetInstall
let g:jsx_ext_required = 1
" We bind it to <leader>e here, feel free to change this
"nmap <space>e :CocCommand explorer<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Dracu :colorscheme dracula 

nnoremap <space>r :Rc<cr>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
autocmd FileType c command! -nargs=0 Rc :sp|:res -10|:term gcc %;./a.out
autocmd FileType cpp command! -nargs=0 Rc :sp|:res -10|:term g++ %;./a.out
autocmd FileType python command! -nargs=0 Rc :sp|:res -10|:term python3 % <cr>i
autocmd FileType go command! -nargs=0 Rc :sp|:res -10|:term go run % <cr>i

" golang
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 2
let g:go_list_type = "quickfix"
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
"au filetype go inoremap <buffer> . .<C-x><C-o>

tnoremap <C-n> <C-\><C-n>
syntax  on
"set mouse=a
set ignorecase
set title
set autochdir
set relativenumber
nmap <F2> :set relativenumber!<cr>
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

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c,*.go,*.py call UpdateTags()

function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

"set theme 
set termguicolors
colorscheme gruvbox 
let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark="medium"
set background=dark
highlight normal     ctermbg=none guibg=none
highlight SignColumn guibg=none ctermbg=none
"autocmd VimEnter * hi Normal ctermbg=none guibg=none
"highlight LineNr     ctermfg=NONE guifg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE

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
nnoremap <Leader>t :vs\|:ter<CR>
set splitbelow
set splitright


"map
"Easy Motion
let mapleader="\\"
let maplocalleader="\\"
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <Space>f <plug>(easymotion-bd-f)
nmap <Space>f <plug>(easymotion-overwin-f)

"autosave
nnoremap <Space>w :w<CR>
"exis
nnoremap qq :qa 
nnoremap <Space>q :q<CR> 

inoremap <C-c> <Esc>
noremap <Space>y "+y

nnoremap <C-s><C-j> :bp<cr>
nnoremap <C-s><C-k> :bn<cr>
nnoremap <C-s><C-l> :ls<cr>:b

noremap H ^
noremap L $

nnoremap <space>e :NERDTreeToggle<CR>

" fzf
nnoremap <Space>b :Buffers<cr>
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
let g:airline_theme='hybrid'
"let g:airline_focuslost_inactive = 0
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
let g:airline_extensions = ['branch', 'fugitiveline', 'fzf']
" empty third and fourth sections
"let g:airline_section_c="%T"
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


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
" ---- coc comment -----
"
"let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-java', 'coc-explorer']
"let g:coc_disable_transparent_cursor = 1
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
""nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

 ""Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
""autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
