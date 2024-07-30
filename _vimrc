" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" vim custom

set relativenumber
set number
syntax on
set noswapfile
set nowritebackup
set nobackup
colorscheme desert
set mouse=a
inoremap jk <Esc>
au GUIEnter * simalt ~x
set hls
set is
set cb=unnamed
set gfn=Fixedsys:h10
set ts=4
set sw=4
set si
set noundofile
cd E:\
autocmd filetype c nnoremap <F9> :w <bar> !gcc % -o %:r<CR>
autocmd filetype c nnoremap <F10> :!%:r<CR>
autocmd filetype java nnoremap <F9> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F10> :!java %:r<CR>
autocmd filetype py nnoremap <F10> :w <bar> !python -u %<CR>

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
inoremap ( ()<Left>
inoremap () ()
inoremap " ""<Left>
inoremap "" ""
inoremap [ []<Left>
inoremap [] []
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a




inoremap intmain #include <stdio.h><CR><CR>int main(){<CR>}<Esc>O
inoremap <silent> javamain class  {<CR>public static void main(String[] args) {<CR><CR>} <CR>}<Esc>ggwhi

inoremap sout System.out.println();<Left><Left>


" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction



