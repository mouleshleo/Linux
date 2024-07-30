set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" Enable airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Set the airline theme
let g:airline_theme='deus'

Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme dracula
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vim custom


set noswapfile       " Disable swap files
set nobackup         " Disable backup files
set nowritebackup    " Disable persistent backup files



set number                " Show line numbers
set rnu
syntax on                 " Enable syntax highlighting
colorscheme desert        " Set colorscheme to desert
set mouse=a               " Enable mouse support
inoremap jk <Esc>         " Map 'jj' to Escape in insert mode
au GUIEnter * simalt ~x   " Close GUI Vim with Alt+F4
set hls                   " Highlight search results
set is                    " Incremental search
set cb=unnamed            " Use the clipboard for all yank, delete, change, and put operations
set ts=4                  " Set tab stop to 4 spaces
set sw=4                  " Set shift width to 4 spaces
set si                    " Smart indent
set noundofile            " Disable undo file
cd ~/                     " Change default directory to home

" C filetype settings
autocmd filetype c nnoremap <F9> :w <bar> !gcc % -o %:r<CR>
autocmd filetype c nnoremap <F10> :!./%:r<CR>

" Java filetype settings
autocmd filetype java nnoremap <F9> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F10> :!java %:r<CR>

" Python filetype settings
autocmd filetype python nnoremap <F10> :w <bar> !python3 %<CR>

" Status line settings
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Insert mode mappings for braces and parentheses
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

" Save file with Ctrl-s in normal and insert modes
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Insert mode mappings for common code snippets
inoremap intmain #include <stdio.h><CR><CR>int main(){<CR>}<Esc>O
inoremap javamain class  {<CR>public static void main(String[] args) {<CR><CR>} <CR>}<Esc>ggwhi
inoremap sout System.out.println();<Left><Left>


nnoremap j gj
nnoremap k gk
nnoremap <C-v> "+p
inoremap <C-v> <C-r><C-o>+

