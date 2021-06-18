" vim: set foldmethod=marker:
" 
" Open folds with zo, close with zc


"Plugins {{{
call plug#begin(stdpath('data') . '/plugged')
"provides snippets and  automcomplete  support  similar visual studio
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'

" Plug 'dag/vim-fish'
"
" function! ConfigPreview(info)
" 	" info is a dictionary with 3 fields
" 	" - name:   name of the plugin
" 	" - status: 'installed', 'updated', or 'unchanged'
" 	" - force:  set on PlugInstall! or PlugUpdate!
" 	if a:info.status == 'installed' || a:info.force
" 		require('goto-preview').setup {
" 		width = 120; -- Width of the floating window
" 		height = 15; -- Height of the floating window
" 		default_mappings = false; -- Bind default mappings
" 		debug = false; -- Print debug information
" 		opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
" 		}
" 	endif
" endfunction


Plug 'rmagatti/goto-preview'

Plug 'JuliaEditorSupport/julia-vim'

" ColorScheme {{{
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'morhetz/gruvbox'
"}}}
"
" git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}
"jump between panes with  vim keys
Plug 'christoomey/vim-tmux-navigator'
"provides html parsing  ability. Perhaps covered by coc? temporarily
"uninstalling to check
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'davidhalter/jedi-vim'
"the notorious
Plug 'tpope/vim-surround'

" Plug 'moll/vim-node'
"also perhaps vovered by  coc?
" Plug 'myhere/vim-nodejs-complete'

"for opening  lines of code in a new window? explore later
" Plug 'chrisbra/NrrwRgn'

" Plug 'eslint/eslint'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }


" Plug 'ctrlpvim/ctrlp.vim'

"compiles python live time
Plug 'metakirby5/codi.vim'

"  vim snippets and snippets engine
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'machakann/vim-highlightedyank'

Plug 'preservim/nerdtree'
"
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'

"Pros and markdown {{{
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'reedes/vim-pencil'
"}}}
"
" Aligns by character chosen {
Plug 'junegunn/vim-easy-align'
"
"comment out lines with gcc or gc<action>"{
Plug 'tpope/vim-commentary'

"fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"for latex
Plug 'lervag/vimtex'
" Plug 'matze/vim-tex-fold'

"for note taking vim-misc is required by vim-notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" for htmlo tags
" Plug 'mattn/emmet-vim'
"
Plug 'jpalardy/vim-slime'

Plug 'vimpostor/vim-tpipeline'

" Plug 'tpope/vim-rails'
call plug#end()
"}}}

" latex configurations {{{
let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'skim'
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
  " source $HOME/.config/nvim/coc.vim
endif
" }}}

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme

colorscheme dracula
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on


"FINDING FILES:
"Search Down into subfolders. provides tab-completion for all file-related
"tasks ** means to search all subdirectories
set path+=**
"Display all matching files when we tab complete
set wildmenu
"Hit tab to :find by partial match
"-use * to make it fuzzy

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)

" cmap F Files
command! F Files



" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read /Users/ephraimsutherland/.config/nvim/snippets/.skeleton.html<CR>3jwf>a
nnoremap ,tex :-1read /Users/ephraimsutherland/.config/nvim/snippets/.skeleton.tex<CR>39GfC
nnoremap ,beamer :-1read /Users/ephraimsutherland/.config/nvim/snippets/.skeleton.beamerTex<CR>15Gfp

" for ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


"set's relative line number
set nu
set rnu

"use nu or set number for non relative numbering
"

"set background=dark changes to dark background
"highlight Normal ctermfg=grey ctermbg=black
"
"

set ignorecase
set smartcase
set backspace=indent,eol,start
set smarttab

"close brackets in insert mode {{{
"Escape by typing ctr-v before
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
"for vim
" inoremap \[ \[<CR>\]<ESC>O
"}}}

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/undodir
"don't search node_modules folder
set wildignore+=**/node_modules/**
" inoremap <C-e> <C-o>$
" inoremap <C-a> <C-o>0


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


set pastetoggle=<F2>

set inccommand=nosplit

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


set foldmethod=marker

"spelling correction on the fly
setlocal spell
set spelllang=en
inoremap <S-C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Make Y yank till end of line because there's already fucking yy
nnoremap Y y$


" Highlight current line & column {{{
set nocuc
hi! link CursorLineNR CursorLine
hi! link CursorColumn CursorLine
" highlight Folded cterm=underline ctermbg=NONE

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    "utocmd WinEnter * set cuc
    "utocmd WinLeave * set nocuc
augroup END
"}}}
"
" vim-slime 
"
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}



augroup filetype_tex
	autocmd!
	autocmd QuitPre,BufDelete *.tex :VimtexClean
augroup END

augroup planet_file
	autocmd!
	autocmd BufWrite planet.py :!../pushSync.sh
augroup END


" Hoping to speed up scrolling speed. Sets Syntax highlight column number
" set synmaxcol=200

" allows scroll etc
set mouse=n

" A syntax for placeholders
" Pressing Control-j jumps to the next match.
" let mapleader = ","
noremap <Leader>n <Esc>/<++><CR><Esc>cf>
inoremap <Leader><Space><Space> <++>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"
" no highlighting once search is complete
" set nohlsearch


luafile ~/.config/nvim/lua/lsp/python-lsp.lua

lua << EOF

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  end
EOF

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>

source ~/.config/nvim/lua/lsp-wrapper.vim

let $PAGER=''

