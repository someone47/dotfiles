" ~/.config/nvim/init.vim

set nocompatible                " disable compatibility to old-time vi
set number                      " show line numbers
set showmatch                   " show matching brackets
set ignorecase                  " case insensitive matching
set hlsearch                    " highlight search results
set tabstop=4                   " number of columns occupied by a tab character
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                   " converts tabs to white space
set shiftwidth=4                " width for autoindents
set autoindent                  " indent a new line the same amount as the line just typed
set mouse=v                     " middle-click paste with mouse
set wildmode=longest,list       " get bash-like tab completions

filetype plugin indent on       " allows auto-indenting depending on file type
syntax on                       " syntax highlighting


"""
"""  Key mappings
"""

" Kill the arrow keys because we want to stay in the base row
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
