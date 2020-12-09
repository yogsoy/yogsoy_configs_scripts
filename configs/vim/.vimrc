" this dude damian conway did this thing for a thing in like 2013
" so some of these top bits are taken from the stuff he showed

" highlight all matches when searching (/[text])
set hlsearch

" fuck you work it out
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
vnoremap <C-X> <Esc>`.``gvP``P

nmap o o<esc>
nmap O O<esc>

" makes file searches and opens and saves case insensitive (tab complete)
set wildignorecase

" show trailing whitespace and tabs
set list listchars=tab:\ \ ,trail:█

" swap the : in commands to ; for ease of typage
"nnoremap ; :
"nnoremap : ;

" set correct shell
set shell=/bin/bash

set number relativenumber

" plugg
call plug#begin()
Plug 'ollykel/v-vim'
"Plug 'mboughaba/i3config.vim'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" commands
command W w
command Q q
command Wq wq
command WQ wq

command! -nargs=? Ftedit execute "tabe ~/.vim/ftplugin/" . ("<args>" == "" ? &filetype : "<args>") . ".vim"

au BufWritePost .Xresources !xrdb %
