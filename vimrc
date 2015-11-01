set nocompatible
syntax on

if &term =~ '256color'
  set t_ut=
endif

" enable per-directory .vimrc files
set exrc
" disable unsafe commands in local .vimrc files
set secure

" font
"set gfn=Monaco:h12
set gfn=Menlo:h12

filetype off
call pathogen#infect()
filetype plugin indent on

" enable mouse
set mouse=a
set ttymouse=xterm2

" autocomplete for c
set tags+=~/.vim/tags/glib-2.0

" remove scrollbars in gvim
set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions-=T

set autoread " watch for file changes

set encoding=utf-8
set autoindent
"set nosmartindent
set history=10000
set number
set hidden
set backspace=indent,eol,start
set textwidth=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>aa :Ack<space>

"set cursorline
set wrap
set noswapfile
set bs=2

set wildignore+=reports/**
set wildmenu

"set winwidth=90
"set winminwidth=15
"set winheight=5
"set winminheight=5
"set winheight=999

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" set quickfix window to appear after grep invocation
autocmd QuickFixCmdPost *grep* cwindow

":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" automatically populate the g:airline_symbols dictionary with the powerline
" symbols - https://github.com/powerline/fonts
let g:airline_powerline_fonts = 1

" bring up the status line on load
set laststatus=2

" enable new theme colors for molokai
let g:rehash256 = 1

set t_Co=256
set background=dark
"colorscheme Tomorrow-Night
"colorscheme candycode
"colorscheme xoria256
"colorscheme molokai
colorscheme jellybeans

" remove background for terminal transparencies
hi Normal ctermbg=none

" Highlight word under cursor
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

function! TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

au FileType ruby setl sw=2 sts=2 et
au FileType c setl sw=2 sts=2 et
au FileType cpp setl sw=2 sts=2 et
au FileType h setl sw=2 sts=2 et

noremap f :Autoformat<CR>
let g:formatdef_my_custom_c = '"clang-format -style=file"'
let g:formatters_h = ['my_custom_c']
let g:formatters_c = ['my_custom_c']
let g:formatters_cpp = ['my_custom_c']
let g:formatters_hpp = ['my_custom_c']

nmap <S-Enter> O<Esc>

" Keymaps

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

map <silent> <LocalLeader>1 :make<CR>
map <silent> <LocalLeader>2 :make -s check<CR>
map <silent> <LocalLeader>3 :! G_MESSAGES_DEBUG=Babirusa ./src/bin/babirusa -p test<CR>
map <silent> <LocalLeader>4 :! valgrind ./src/bin/babirusa -p test<CR>

nmap , \
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>t :CtrlP<CR>
imap <C-L> <SPACE>=><SPACE>

let g:CommandTAcceptSelectionSplitMap=['<C-s>']
let g:CommandTAcceptSelectionVSplitMap=['<C-v>']
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTMaxHeight=10

" copy and paste to clipboard
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" better j,k
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" split line
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" HTML tag folding
nnoremap <leader>ft Vatzf

" CSS properties sorting
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" key mappings for running tests
map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

" commenting
map <leader>cc :s/^/#/g<cr>:noh<cr>
map <leader>cu :s/^#//g<cr>:noh<cr>

nmap <F8> :TagbarToggle<CR>

" let g:gitgutter_highlight_lines=1
