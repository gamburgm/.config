filetype plugin indent on

let $MYVIMRC = '~/.config/nvim/init.vim'
let mapleader=','

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'lifepillar/vim-solarized8'    " colorscheme
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy file search
Plug 'scrooloose/nerdtree'          " directory tree
Plug 'sheerun/vim-polyglot'         " syntax coloring (is okay)
Plug 'vim-airline/vim-airline'      " Status line for vim
Plug 'vim-airline/vim-airline-themes' " Themes for status line
Plug 'mhinz/vim-startify'           " for DOOM
Plug 'tpope/vim-fugitive'           " for git
Plug 'tpope/vim-commentary'         " For commenting things out
Plug 'luochen1990/rainbow'          " for rainbow parens
Plug '~/vim-racket'                 " For racket
" Plug 'rachitnigam/drracket.vim'     " For Dr.Racket Arrows -> It doesn't work very well, kinda want to clone and modify
Plug 'neovim/nvim-lspconfig'        " For built-in NeoVim LSP client
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lervag/vimtex'
" Plug 'kovisoft/slimv'
" Plug 'vim-scripts/paredit.vim'      " For working with Lisps

call plug#end()

" TODO for latex:
" - VimTex additional plugins and setup (linting, surrounds, formatting, LSP,
"   etc
" - figure out good mappings & commands (snippets?)
" - read the VimTex docs and squeeze as much value as possible

" language server setup
" would love to add racket but can't currently

lua << EOF
local lspconfig = require'lspconfig'

local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local default_servers = { 'clangd', 'jedi_language_server', 'tsserver', 'eslint' }
for _, lsp in pairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

lspconfig.ocamllsp.setup{
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern('Makefile', '.merlin'),

  flags = {
    -- Same as above
    debounce_text_changes = 150,
  }
}

-- Treesitter (I really need to migrate some stuff to a separate init.lua or something, I hate this)
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'javascript',
    'json',
    'latex',
    'make',
    'markdown',
    'ocaml',
    'ocamllex',
    'python',
    'query',
    'tsx',
    'typescript',
    'vim',
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

set exrc				    " allow for directory-specific vimrc's

set tabstop=2       " number of spaces tab is shown as
set softtabstop=2		" number of spaces in a tab in editing
set shiftwidth=2		" set indent as 2 spaces
set expandtab			  " convert tabs to spaces
set smarttab        " insert tabs based on shiftwidth, not tab size
set shiftround      " use shiftwidth to determine tabbing w/'<' and '>' commands

set autoindent      " always auto-indent
set copyindent      " copy the previous line's indent on autoindent


let python_highlight_all=1 " for python linting

set number				  " line numbers
set relativenumber  " relative line numbers
syntax enable			  " colors for syntax
set showcmd				  " shows last command in bottom bar
set cursorline	    " highlights current line
set wildmenu			  " show all autocomplete options (e.g. :e)
set showmatch			  " show matching brackets
set lazyredraw      " only redraw when something has been changed

set hidden          " hide previously open buffers rather than closing them (e.g., :e)

set nobackup        " don't create backup files
set nowritebackup   " don't create write-backup files
set noswapfile      " don't create backup swap files

set updatetime=300  " shorter update time for VIM and plugins

set shortmess+=c    " Don't pass messages to ins-completion-menu
set signcolumn=yes  " pre-load the column for coc warnings so that you don't have to redraw everything everytime

noremap <C-N> :NERDTreeToggle<CR>
noremap <C-F> :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeFocus<CR>

" navigate splits more easily
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pv :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

" set termguicolors and make compatible with tmux
" if exists('+termguicolors')
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark     " dark colorscheme
colorscheme solarized8  " solarized colorscheme

set incsearch			" search as characters are entered
set hlsearch			" highlight matches
set ignorecase		" ignore case for search
set smartcase     " ignore case if search pattern all lowercase, case-sensitive otherwise TODO does this break the above one?

" move vertically by visual line--don't skip screen-wrapped lines
nnoremap j gj
nnoremap k gk

" allows backspace in insert mode to delete all characters
" including tabs, eol, and where the cursor started
" see :help 'backspace'
set backspace=indent,eol,start

augroup commentary
  autocmd!
  autocmd FileType racket setlocal commentstring=;;\ %s
augroup END

augroup racket_ft
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.rkt set filetype=racket
augroup END

augroup file_templates
  autocmd!
  autocmd BufNewFile *.rkt 0r ~/.config/nvim/racket.temp.rkt
  autocmd BufNewFile *.sh  0r ~/.config/nvim/bash.temp.sh
augroup END

augroup embryo
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.emb set filetype=racket
augroup END

augroup asm
  autocmd!
  autocmd BufNewFile,BufRead,BufWrite *.asm set filetype=asm
augroup END

" would be cool to have an abbreviation that expands if to if..else..end in
" elixir

" custom header for vim screen, inspired by DOOM emacs

let g:ascii = [
  \ "=================     ===============     ===============   ========  ========",
  \ "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
  \ "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
  \ "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
  \ "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
  \ "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
  \ "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
  \ "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||", 
  \ "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
  \ "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
  \ "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
  \ "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
  \ "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
  \ "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
  \ "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
  \ "||.=='    _-'                                                     `' |  /==.||",
  \ "=='    _-'                                                            \\/   `==",
  \ "\\   _-'                                                                `-_   /",
  \ "`''                                                                      ``'",
  \]

  " \ ["  The object-oriented model makes it easy to build up programs by accretion.\n     What this often means\n, in practice, is that it\n provides a structured way to write spaghetti\n code."]
let g:startify_custom_header_quotes = [
  \ ["                                Welcome to VIM"],
  \ ["                                Welcome to HELL"],
  \ ["                          Correct answer, zero points"],
  \ ["                        I'll give you a hint: left paren"],
  \ ["                                     oopsah"],
  \ ["                What is the biggest lie in computing? It works."],
  \]

let g:startify_custom_header = startify#center(g:ascii + g:startify#fortune#quote())

let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':    ['<BS>'],
  \ 'PrtCurleft()': ['<C-[>', '<left>', '<C-^>'],
  \ 'PrtCurRight()': ['<C-]>', '<right>'],
  \ 'ToggleType(1)': ['<C-L>', '<C-Up>'],
  \ 'ToggleType(-1)': ['<C-H>', '<C-Down>'],
  \ }

let g:ctrlp_match_window = 'results:100'

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

let g:rainbow_active = 1

if executable('rg')
	set grepprg=rg\ --color=never
	let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_caching = 0
endif

" Terminal config
tnoremap <Esc> <C-\><C-N>
tnoremap <C-W> <Esc><C-W>

" VimTeX config
" TODO what is forward search? is this latex jargon?
" FIXME hack: I move SumatraPDF.exe to SumatraPDF somewhere that my $PATH includes
if (has('wsl') && executable('SumatraPDF'))
  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
elseif (has('unix') && executable('zathura'))
  let g:vimtex_view_method = 'zathura'
endif

let g:vimtex_compiler_latexmk = {
  \ 'options': [
  \ '-verbose',
  \ '-file-line-error',
  \ '-synctex=1',
  \ '-interaction=nonstopmode',
  \ '--shell-escape',
  \ ],
  \ }

let g:vimtex_compiler_latexmk_engines = { '_': '-xelatex' }
let g:vimtex_quickfix_open_on_warning = 0
