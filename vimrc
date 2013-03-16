set nocompatible
filetype off

" OS Detection
if has('win32') || has('win64')
    let $OS = 'windows'
endif

set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
call vundle#rc()

Bundle 'gmarik/vundle'

" Language plugins
Bundle "empanda/vim-varnish"
Bundle "groenewege/vim-less"
Bundle "Glench/Vim-Jinja2-Syntax"
Bundle 'jnwhiteh/vim-golang'
Bundle "PProvost/vim-ps1"
Bundle "rodjek/vim-puppet"
Bundle "tpope/vim-markdown"
Bundle "vim-scripts/pep8"
Bundle "alfredodeza/pytest.vim"
Bundle "fs111/pydoc.vim"
Bundle "ervandew/supertab"
Bundle "davidhalter/jedi-vim"

" Other plugins
Bundle "godlygeek/tabular"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "Lokaltog/vim-powerline"
Bundle "mileszs/ack.vim"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-fugitive"
Bundle "tomtom/tcomment_vim"

" Personal bundles
Bundle 'samudelacruz/vim-misc'

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin indent on
syntax on
" Windows scp commands copy plink.exe, pscp.exe and sftp.exe to system32
" folder and rename as acorded below, have in mind that will ask for passwd
if $OS == 'windows'
    let g:netrw_cygwin = 0
    let g:netrw_list_cmd = "plink.exe -P ls -Fa "
    let g:netrw_ssh_cmd  = "plink.exe -T -ssh"
    let g:netrw_scp_cmd  = "scp.exe -P scp"
    let g:netrw_sftp_cmd = "sftp.exe -P "
    let g:netrw_silent = 1
endif

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
" Load in my custom vimrc if it exists
" Load in my custom vimrc if it exists
if filereadable(expand('~/.vim/bundle/vim-misc/vimrc.vim'))
    source ~/.vim/bundle/vim-misc/vimrc.vim
endif
