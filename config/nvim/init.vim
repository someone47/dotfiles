" ~/.config/nvim/init.vim

set nocompatible                " disable compatibility to old-time vi
set number                      " show line numbers
set showmatch                   " show matching brackets

"""
""" Key mappings
"""

" Kill the arrow keys because we want to stay in the base row

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
