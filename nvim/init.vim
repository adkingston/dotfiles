" set python dir
let g:python3_host_prog = '/usr/bin/python3.8'

call plug#begin(stdpath('data').'/plugged')
" color
"Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" gui control
Plug 'webdevel/tabulous'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" golang
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'tag': '*' }

" javascript
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" latex
Plug 'lervag/vimtex'
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_enabled = 1
Plug 'vim-latex/vim-latex'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" YAML / Formating 
Plug 'tarekbecker/vim-yaml-formatter'
let g:yaml_formatter_indent_collection=1

Plug 'neomake/neomake'

" airline
Plug 'vim-airline/vim-airline'
"Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'


" airline theme
let g:airline_extensions_branch_enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_extentions_tabline_left_sep = ' '
let g:airline_extensions_tabline_formatter = 'jsformatter'
let g:airline_extensions_tabline_enabled = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
call plug#end()

"---------------------------------------------------------------------------------------------------
"   " latex
"---------------------------------------------------------------------------------------------------

" When writing a buffer (no delay).
call neomake#configure#automake('w')

"---------------------------------------------------------------------------------------------------
"   " color scheme
"---------------------------------------------------------------------------------------------------
set termguicolors 
let $NVIM_TUI_ENABE_TRUE_COLOR=1
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE


"---------------------------------------------------------------------------------------------------
"   " spell check
"---------------------------------------------------------------------------------------------------
set spelllang=en

autocmd FileType tex :set spell
autocmd FileType tex :VimtexCompile
"---------------------------------------------------------------------------------------------------
"  " coc.nvim default settings
"  -------------------------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window

let mapleader = ","

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" spaces & tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" UI configs
set number 
set showcmd
set cursorline
set showmatch
set laststatus=2
set nobackup
set noswapfile

" improve esc
inoremap jk <esc>



" split navigation
nnoremap <leader>j <c-w><c-j>
nnoremap <leader>k <c-w><c-k>
nnoremap <leader>l <c-w><c-l>
nnoremap <leader>h <c-w><c-h>

" tab navigation
nnoremap <c-Left> :tabprevious<CR>
nnoremap <c-Right> :tabnext<CR>

" useful shortcuts
" nerdtree
nnoremap <c-n> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree
" GoImports
nnoremap <M-i> :GoImports<cr>
nnoremap <M-d> :GoDef<cr>
nnoremap <M-d>t :GoDefType<cr>
nnoremap <M-j> :GoAddTags json,omitempty<cr>
nnoremap <M-b> :GoAddTags bson,omitempty<cr>
nnoremap <M-r> :GoRename<cr>
nnoremap <M-e> :GoIfErr<cr>
nnoremap <M-k> :GoKeyify<cr>
nnoremap <M-o> :GoDecls %:p<cr>

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

:autocmd FileType python set colorcolumn=80

