set nocompatible
set fileencoding=utf-8
filetype off
let mapleader=","         " The <leader> key
set autoread              " Reload files that have not been modified
set backspace=2           " Makes backspace not behave all retarded-like
set colorcolumn=80        " Highlight 80 character limit
set hidden                " Allow buffers to be backgrounded without being saved
set laststatus=2          " Always show the status bar
set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set relativenumber
set number                " Show relative line numbers
set ruler                 " Show the line number and column in the status bar
set encoding=utf-8
set termencoding=utf-8
set t_Co=256              " Use 256 colors
set scrolloff=999         " Keep the cursor centered in the screen
set showmatch             " Highlight matching braces
set showmode              " Show the current mode on the open buffer
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set visualbell            " Use a visual bell to notify us
set bs=2                  " Normal backspace behaviour
set noshowmode            " Hide the default mode text (e.g. -- INSERT -- below the statusline)
syntax on                 " Enable filetype detection by syntax


set runtimepath+=~/.vim/bundle/ultisnips_rep
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'altercation/vim-colors-solarized'
Bundle 'michalbachowski/vim-wombat256mod'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tomasr/molokai'
Bundle 'Shutnik/jshint2.vim'

filetype plugin indent on

" disable arrow keys
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Use l to toggle display of whitespace
nmap <Leader>l :set list!<CR>

" automatically change window's cwd to file's dir
set autochdir

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" Make j/k visual down and up instead of whole lines. This makes word
" wrapping a lot more pleasent.
map j gj
map k gk

" cd to the directory containing the file in the buffer. Both the local
" and global flavors.
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Shortcut to edit the vimrc
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>

" Easy movement between tabs

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Make navigating around splits easier
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" easy indent/outdent
nnoremap < <gv
nnoremap > >gv

" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<cr>

" Expand in command mode to the path of the currently open file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc
if has("autocmd")
    augroup vimrc
        " Clear all autocommands in the group to avoid defining them multiple
        " times each time vimrc is reloaded. It has to be only once and at the
        " beginning of each augroup.
        autocmd!
        " Jump to the last position when reopening a file.
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
          \ | exe "normal! g'\"" | endif
        " Automatically resize window splits when the application is resized.
        autocmd VimResized * exe "normal! \<c-w>="
        " Source .vimrc automatically when it is saved.
        autocmd BufWritePost *vimrc source $MYVIMRC
        " Work around to fix Powerline colors (something clears highlighting).
        " https://github.com/Lokaltog/vim-powerline/issues/28#issuecomment-3492408
        autocmd BufWritePost *vimrc call Pl#Load()
    augroup END
endif
" sort alphabetically (for functions on imports)
vnoremap <Leader>s :sort<CR>

"Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Use arrow keys to change buffers
noremap <left> :bp<CR>
noremap <right> :bn<CR>

"----------------------------------------------------------------------
"GUI and colorschemes
"----------------------------------------------------------------------

" Show extra whitespaces
autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Colorscheme
colorscheme molokai

" GUI
if has("gui_running")
    set guifont=Inconsolata\ for\ Powerline:h14
    set guioptions=egmt
    set fuopt+=maxhorz
    set title
else
    set term=xterm-256color
endif
"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999

" Reload Powerline when we read a Puppet file. This works around
" some weird bogus bug.
autocmd BufNewFile,BufRead *.pp call Pl#Load()

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

autocmd FileType text set filetype=markdown

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"----------------------------------------------------------------------
" Misc settings
"----------------------------------------------------------------------

set history=700
set undolevels=700
set nobackup
set nowritebackup
set noswapfile

" Python folding
set nofoldenable

"----------------------------------------------------------------------
" Plugin settings
"----------------------------------------------------------------------

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2

" Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>

" Powerline
let g:Powerline_symbols="fancy" " Fancy styling

" NERDtree
map <F2> :NERDTreeToggle<CR>

" CtrlP

let g:ctrlp_max_files = 10000
if has("unix")
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
    \ }
endif

" JShint
let jshint2_command = "/usr/local/bin/jshint"
let jshint2_read = 1
let jshint2_save = 1
let jshint2_close = 0

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F4> :lnext<CR>
inoremap <silent><F4> <C-O>:lnext<CR>
vnoremap <silent><F4> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" Jedi-vim
let g:jedi#use_tabs_not_buffers = 0 "Use buffers instead of tabs
let g:jedi#show_call_signatures = 0 "Disable windows showing function definition
