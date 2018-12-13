set nocompatible " required
filetype off " required
set encoding=utf-8

" Remember past commands etc
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.viminfo

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

" Ctrl-C to copy, Ctrl-P to paste to and from clipboard
nnoremap <C-p> "+gP
nnoremap <C-c> "+y

" allow backspacing over everything
set backspace=indent,eol,start

if has("gui_running")
	set guifont=DejaVu\ Sans\ Mono\ 12
	" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
	" set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 11
	" set guifont=TerminessTTF\ Nerd\ Font\ Mono\ 13
endif

" Change font size shortcuts
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" tomorrow themes
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" scroll through color schemes with Ctrl-b and Ctrl-m
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
"nnoremap <C-b> :PrevColorScheme<CR>
"nnoremap <C-m> :NextColorScheme<CR>

" git modifications in gutter
Plugin 'airblade/vim-gitgutter'
" update gitgutter on save
autocmd BufWritePost * GitGutter

" enhanced terminal support. For tmux etc
Plugin 'wincent/terminus'

" indent on functions etc
Plugin 'vim-scripts/indentpython.vim'

" ALE
Plugin 'w0rp/ale'
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['pyls', 'autopep8', 'flake8', 'pylint', 'python']}
let g:ale_fixers = {'python': ['add_blank_lines_for_python_control_statements', 'remove_trailing_lines', 'trim_whitespace', 'isort', 'autopep8']}
" Enable completion where available.
let g:ale_completion_enabled = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Nerdtree file browser
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Nerdtree git things
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on

" theme
"if has("gui_running")
"else
"endif

" Dark Theme
colorscheme Tomorrow-Night
highlight ALEWarning ctermbg=DarkMagenta

" Light Theme
"colorscheme Tomorrow
"highlight ALEWarning ctermbg=LightMagenta

" 80 char column
"highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
"set colorcolumn=80

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set switchbuf=usetab,newtab

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
"nnoremap <Leader>l :ls<CR>
"nnoremap <Leader>b :bp<CR>
"nnoremap <Leader>f :bn<CR>
"nnoremap <Leader>g :e#<CR>
"nnoremap <Leader>1 :1b<CR>
"nnoremap <Leader>2 :2b<CR>
"nnoremap <Leader>3 :3b<CR>
"nnoremap <Leader>4 :4b<CR>
"nnoremap <Leader>5 :5b<CR>
"nnoremap <Leader>6 :6b<CR>
"nnoremap <Leader>7 :7b<CR>
"nnoremap <Leader>8 :8b<CR>
"nnoremap <Leader>9 :9b<CR>
"nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Mappings to access tabs (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
"nnoremap <Leader>l :ls<CR>
nnoremap <C-Left>  :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <S-Left>  :-tabmove<CR>
nnoremap <S-Right> :+tabmove<CR>
"nnoremap <Leader>g :e#<CR>
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
"nnoremap <Leader>3 :3b<CR>
"nnoremap <Leader>4 :4b<CR>
"nnoremap <Leader>5 :5b<CR>
"nnoremap <Leader>6 :6b<CR>
"nnoremap <Leader>7 :7b<CR>
"nnoremap <Leader>8 :8b<CR>
"nnoremap <Leader>9 :9b<CR>
"nnoremap <Leader>0 :10b<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP 8 indentation
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" flag white space
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" remember last cursor position when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"activate python virtualenv
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" show the matching pair of braces
set showmatch

" Show line under cursor
set cursorline

" Enable mouse
set mouse=a
