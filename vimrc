" --------- Interaction ----------
set encoding=utf-8
set mouse=a
set showcmd
set showmode
set wildmode=longest,list,full
set timeoutlen=300
" --------- Interaction ----------
" ---------- Tab ----------
set nowrap
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
" ---------- Tab ----------
" ---------- Color ----------
syntax on
set number
set ignorecase
set hlsearch
set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=black guibg=black
highlight LineNr ctermfg=darkgray
" ---------- Color ----------
" ---------- Alternate Escape ----------
imap ,, <C-c>
inoremap ,, <C-c>
" nnoremap <c-k> <c-v>
" ---------- Alternate Escape ----------
" ---------- Function Keys ----------
set pastetoggle=<F2>
map <F3> :set wrap! breakindent!<CR>
map <F4> :set number!<CR>
map <F5> :vsp<CR> "vertical split
" ---------- Function Keys ----------
