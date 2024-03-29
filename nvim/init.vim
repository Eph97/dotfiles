" vim: set foldmethod=marker:
" vim: set ft=vim et sw=2:

"Plugins {{{
" Bootstrap plugin manager installation
lua << EOF
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/autoload/plug.vim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!curl -fLo '..install_path..' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
end
EOF

call plug#begin(stdpath('data') . '/plugged')
"provides snippets and  automcomplete  support  similar visual studio
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-eunuch'

" Plug 'tpope/vim-sensible'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'airblade/vim-rooter'

" Plug 'dag/vim-fish'

Plug 'rmagatti/goto-preview'

Plug 'JuliaEditorSupport/julia-vim'

" ColorScheme {{{
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
"}}}
"
" git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}
"jump between panes with  vim keys
Plug 'christoomey/vim-tmux-navigator'
"
"uninstalling to check
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"the notorious
Plug 'tpope/vim-surround'


"for opening  lines of code in a new window? explore later
Plug 'chrisbra/NrrwRgn'

" Plug 'ctrlpvim/ctrlp.vim'

"compiles python live time
Plug 'metakirby5/codi.vim'

"  vim snippets and snippets engine
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'

Plug 'machakann/vim-highlightedyank'

Plug 'preservim/nerdtree'
"
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

"for note taking vim-misc is required by vim-notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" for htmlo tags
" Plug 'mattn/emmet-vim'

" allow JSX syntax highlighting and context dependent comments
Plug 'suy/vim-context-commentstring'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'Eph97/vim-slime'

Plug 'vimpostor/vim-tpipeline'

" stata
Plug 'poliquin/stata-vim' " syntax highlighting
Plug 'zizhongyan/vim-stata'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Eph97/vim-rmarkdown'
" Plug 'tpope/vim-rails'
"
Plug 'eigenfoo/stan-vim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }


Plug 'github/copilot.vim'

Plug 'goerz/jupytext.vim'

Plug 'justinmk/vim-sneak'

call plug#end()
"}}}

" LUA CONFIGS
" luafile ~/.config/nvim/lua/lsp/python-lsp.lua
" luafile ~/.config/nvim/lua/lsp/bash-lsp.lua
" luafile ~/.config/nvim/lua/lsp/latex-lsp.lua

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  vim.cmd 'source ~/.config/nvim/lua/lsp-wrapper.vim'
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- if client.name == 'r_language' then
    -- client.diagnostics = false
    -- client.resolved_capabilities.document_formatting = false
  -- end

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'bashls', 'r_language_server', 'vimls'} 
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- vim.diagnostic.config({
--   virtual_text = false,
-- })

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
EOF


" for completion suggestions
set completeopt=menu,menuone,noselect


" latex configurations {{{
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:vimtex_view_method='zathura'
" let g:vimtex_view_method = 'skim'
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
  " source $HOME/.config/nvim/coc.vim
endif
" }}}

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
"set background=dark changes to dark background
"highlight Normal ctermfg=grey ctermbg=black

colorscheme ayu
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

"FINDING FILES:
"Search Down into subfolders. provides tab-completion for all file-related
"tasks ** means to search all subdirectories
set path+=**
"Display all matching files when we tab complete
set wildmenu

" Insert mode completion
"
" inoremap <expr> <plug>(fzf-complete-path)      fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'")
imap <c-x><c-f> <plug>(fzf-complete-path)


" FZF search shortcut
command! F Files

cnoreabbrev Wq wq

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.config/nvim/snippets/.skeleton.html<CR>3jwf>a
nnoremap ,pset :-1read $HOME/.config/nvim/snippets/.skeleton.tex<CR>9GfC
nnoremap ,beamer :-1read $HOME/.config/nvim/snippets/.skeleton.beamer.tex<CR>15Gfp
nnoremap ,rmd :-1read $HOME/.config/nvim/snippets/.skeleton.rmd<CR>9G
nnoremap ,leet :-1read $HOME/.config/nvim/snippets/.skeleton.py<CR>7G

" for ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"

"set's relative line number
set nu
set rnu

set ignorecase
set smartcase
set backspace=indent,eol,start
set smarttab

" tell it to use an undo file
set undofile
"don't search node_modules folder
set wildignore+=**/node_modules/**


set inccommand=nosplit

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" set foldmethod=marker

"spelling correction on the fly
" setlocal spell
" set spelllang=en
" inoremap <S-C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Make Y yank till end of line because there's already fucking yy
nnoremap Y y$

" Highlight current line & column {{{
set nocuc
hi! link CursorLineNR CursorLine
hi! link CursorColumn CursorLine
" highlight Folded cterm=underline ctermbg=NONE
highlight Folded guifg=PeachPuff4
"
highlight FoldColumn guibg=darkgrey guifg=white
"
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set viewoptions-=curdir


augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    autocmd WinEnter * set cuc
    autocmd WinLeave * set nocuc
augroup END
"}}}

" vim-slime 
let g:slime_target = "tmux"
" let g:slime_target = "Kitty"
" let g:slime_target = "X11"
" let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}


function! TexClean()
  :VimtexClean
  :!rm *.aux
  :!rm *.gz
endfunction
augroup filetype_tex
	autocmd!
	" autocmd QuitPre,BufDelete *.tex :VimtexClean | :!rm *.aux
	autocmd QuitPre *.tex call TexClean()
augroup END

" augroup planet_file
" 	autocmd!
" 	autocmd BufWrite planet.py :!../pushSync.sh
" augroup END


" Hoping to speed up scrolling speed. Sets Syntax highlight column number
" set synmaxcol=200

" allows scroll etc
set mouse=n

" A syntax for placeholders
" let mapleader = ","
noremap <Leader>n <Esc>/<++><CR><Esc>cf>
inoremap <Leader><Space><Space> <++>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"
" no highlighting once search is complete
" set nohlsearch
"
"
"

let $PAGER=''

function! InstallPackages()
    let winview = winsaveview()
    call inputsave()
    let cmd = ['sudo -S tlmgr install']
    %call add(cmd, matchstr(getline('.'), '\\usepackage\(\[.*\]\)\?{\zs.*\ze\}'))
    echomsg join(cmd)
    let pass = inputsecret('Enter sudo password:') . "\n"
    echo system(join(cmd), pass)
    call inputrestore()
    call winrestview(winview)
endfunction

command! InstallPackages call InstallPackages()

function! Scratch()
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction
command! Scratch call Scratch()

let g:notes_directories = ['~/Documents/Notes']

syn region urlTitle matchgroup=mkdDelimiter start="\[" end="\]" oneline concealends nextgroup=urlRef
syn region urlRef matchgroup=mkdDelimiter start="(" end=")" oneline conceal contained

hi link urlTitle notesRealURL
hi link urlRef notesRealURL

" Run stata do file {{{
function! RunDo(cd="")
  " call system("tmux send-keys -t .1 cd " . expand("%:p:h") . ' C-m')
  " call system("tmux send-keys -t .1 'do '" . expand("%") . ' C-m')
  if a:cd == "cd"
    call slime#send('cd ' . '"' . expand("%:p:h") . '"' . "\r")
  endif
  call slime#send("do " . '"' .expand("%:p") .'"' . "\n")
endfunction


function! Statamarkdown()
  set autochdir
  let pdf = expand("%:r") . '.pdf'
  let fp = '"' . expand("%") . '"'
  " call system(join(['R -e \"rmarkdown::render("', expand("%"), '"']))
  " echo 'stata -b markstat using' . fp . ', pdf'
  call system('stata -b markstat using ' . fp . ', pdf')
endfunction
" }}}
command! Statamarkdown call Statamarkdown()

" " Turn off the 80th column line
let g:vimforstata_set_column = 0

set guitablabel=%t



function! RSend()
    if rmarkdown#nrrwrgn#InsideRChunk() == 1
      let range = rmarkdown#nrrwrgn#ChunkRange()
      exe range[0].','.range[1].'SlimeSend'
    else
        let fp = '"' . expand("%:p") . '"'
        call slime#send("source(".fp.", echo = TRUE, max.deparse.length = 4095)\r")
    endif
endfunction

command! RSend call RSend()
" command! Rreload call Rreload()
" command! Rmarkdown call Rmarkdown()
autocmd FileType rmarkdown setlocal commentstring=#\ %s



let g:rooter_manual_only = 1

function! _EscapeText_r(text)
  call system("cat > ~/.slime_r", a:text)
  return ["source('~/.slime_r', echo = TRUE, max.deparse.length = 4095)\r"]
endfunction

cmap fp let @+ = '"' . expand("%:p") .'"' <cr>
cmap fdir let @+ = '"' . expand("%:p:h") .'"' <cr>
cmap xstata let @+ = 'cd "' . expand("%:p:h") .'" ' . "\ndoedit " . expand("%:t") <cr>

nnoremap <c-n> :noh<CR>



 set noswapfile 



nnoremap t gt 
nnoremap T gT 




function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

vnoremap <silent><leader>f <Esc>:Ag <C-R>=<SID>getVisualSelection()<CR><CR>

set tabstop=4
set shiftwidth=4
set smarttab " Autotabs for certain code


cnoremap sourceconf source $MYVIMRC <cr>


function! Spellcheck()
  setlocal spell spelllang=en_us
endfunction

command! Spellcheck call Spellcheck()

let g:copilot_enabled = v:false

" let g:pandoc#command#prefer_pdf = 0

let g:pandoc#command#custom_open = "MyPandocOpen"

function! MyPandocOpen(file)
    let file = shellescape(fnamemodify(a:file, ':p'))
    let file_extension = fnamemodify(a:file, ':e')
    if file_extension is? 'pdf'
        if !empty($PDFVIEWER)
            return expand('$PDFVIEWER') . ' ' . file
        elseif executable('zathura')
            return 'zathura ' . file
        " elseif executable('mupdf')
        "     return 'mupdf ' . file
        endif
    elseif file_extension is? 'html'
        if !empty($BROWSER)
            return expand('$BROWSER') . ' ' . file
        elseif executable('firefox')
            return 'firefox ' . file
        elseif executable('chromium')
            return 'chromium ' . file
        endif
    elseif file_extension is? 'odt' && executable('okular')
        return 'okular ' . file
    elseif file_extension is? 'epub' && executable('okular')
        return 'okular ' . file
    else
        return 'xdg-open ' . file
    endif
endfunction


" let g:vimforstata_pathbin = /usr/local/stata17/xstata
let g:vimforstata_pathbin = "/usr/bin/xstata"

" source nrrwrgn.vim
command! PyChunk call python#nrrwrgn#NarrowPyChunk()

function! MdToNotebook()
  echo "Markdown to Jupyter Notebook"
  let b:filename = expand("%:r")
  call system("jupytext --to=ipynb --from=md --update --output ".b:filename.".ipynb ".b:filename.".md")
endfunction

function! NotebookToMd()
  echo "Jupyter Notebook to Markdown"
  let l:filename = expand("%:r")
  let l:md_filename = l:filename.".md"
  let l:ipynb_filename = l:filename.".ipynb"
  let l:cmd="jupytext --to=md --output ".l:md_filename." " .l:ipynb_filename
  echo "md to jupyter notebook"
  call system(l:cmd) | execute "edit ".l:md_filename
  " autocmd BufWritePost  call MdToNotebook()
  execute 'autocmd BufWritePost '.l:md_filename.' call MdToNotebook()'
endfunction

let g:jupytext_enable = 0
command! NotebookToMd call NotebookToMd()
command! MdToNotebook call MdToNotebook()
" jupytext --to=md --output test.md test.ipynb
" jupytext --to=ipynb --from=md --update --output test.ipynb test.md
"


" augroup jupytext_ipynb2
"     " Remove all ipynb autocommands
"     au!
"     autocmd BufReadCmd *.ipynb  call Read_from_ipynb2()
" augroup END

" function! Read_from_ipynb2()
"   au! jupytext_ipynb2 * <buffer>
"   execute MdToNotebook
"   let b:filename = expand("%:r")
"   let b:md_filename = b:filename.".md"
"   let b:ipynb_filename = b:filename.".ipynb"
"   " silent execute "edit ++enc=utf-8 ".b:md_filename
"   " silent execute "setl fenc=utf-8 ft=markdown"
"   " silent 1delete
" endfunction
"
function! RunJupyter()
  " let l:line_count=line('$')
  let start = []
  g/^[~`]\{3}python/call add(start, line('.'))
  let end = []
  g/^[~`]\{3}$/call add(end, line('.'))
  " echo len(start)
  " let concat=[start,end]
  let num_chunks = len(start)
  let i = 0
  while i< num_chunks
    " echo "hello world".start[i]."".end[i]
    let first_code = start[i]+1
    let last_code = end[i]-1
    exe first_code.",".last_code." SlimeSend"
    let i +=1
  endwhile
endfunction

command! RunJupyter call RunJupyter()




function! RunRmd()
  " let l:line_count=line('$')
  let start = []
  g/^[~`]\{3}{\?r}\?/call add(start, line('.'))
  let end = []
  g/^[~`]\{3}$/call add(end, line('.'))
  " echo len(start)
  " let concat=[start,end]
  let num_chunks = len(start)
  let i = 0
  while i< num_chunks
    " echo "hello world".start[i]."".end[i]
    let first_code = start[i]+1
    let last_code = end[i]-1
    exe first_code.",".last_code." SlimeSend"
    let i +=1
  endwhile
endfunction

command! RunRmd call RunRmd()
