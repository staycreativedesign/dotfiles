runtime macros/matchit.vim
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'thoughtbot/vim-rspec'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jgdavey/tslime.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'othree/html5.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'junegunn/fzf.vim'
Plugin 'szw/vim-tags'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'christoomey/vim-system-copy'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

call vundle#end()                       " required
filetype plugin indent on               " required

syntax on


" colorscheme Tomorrow-Night
colorscheme duoduo
set rtp+=/usr/local/opt/fzf
set grepprg=ag
set ttyfast
set lazyredraw
set background=dark
set regexpengine=1
set autoindent
let mapleader = "\<Space>"
autocmd BufWritePre * StripWhitespace   " remove white spaces on save
hi MatchParen ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
let g:airline_theme='molokai'
set title
set scrolloff=5
set encoding=utf8
set nobackup
set noswapfile
set hlsearch
" set textwidth=80
set winwidth=100
set winheight=5
set winminheight=5
set splitbelow
set splitright
set shiftround
set ruler
set incsearch
set laststatus=2
set list listchars=tab:»·,trail:·,nbsp:·
set numberwidth=5
set relativenumber
set number
set ignorecase smartcase
set autoread
set shortmess+=c
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let g:ackprg = 'ag --nogroup --nocolor --column'
set iskeyword+=_,$,@,%,# " none of these should be word dividers, so make them not be"
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/.keep
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
let g:syntastic_quiet_messages = { "level": "warnings"  }


" Quick write and quit
" ------------------------
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

" Indentation
" ------------------------
  set backspace=indent,eol,start
  set smartindent
  set smarttab
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set nocursorline

" VP Vim Gutter
" ------------------------
  set updatetime=250

" vp doesn't replace paste buffer
" ------------------------
  " function! RestoreRegister()
  "   let @" = s:restore_reg
  "   return ''
  " endfunction
  " function! s:Repl()
  "   let s:restore_reg = @"
  "   return "p@=RestoreRegister()\<cr>"
  " endfunction
  " vmap <silent> <expr> p <sid>Repl()

" Paste from system clipboard
" ------------------------
  map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" Automatically rebalance windows on vim resize
" -----------------------
  autocmd VimResized * :wincmd =


" Create directory if directory does not exist
" ------------------------
  augroup BWCCreatlDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
  augroup END

" Copy to system clipboard
" ---------------------------------------------------------------------------
  set clipboard=unnamed

" Map Rename File
" ---------------------------------------------------------------------------
  map <Leader>rf :Rename <space>

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" Airline Settings
" -------------------------
  let g:airline_powerline_fonts = 1

" Load vimrc
" -------------------------
  map <Leader>mm :vsplit $MYVIMRC<CR>

" Syntastic Setup
" -------------------------
  " let g:syntastic_scss_sass_args="--load-path ~/.rvm/gems/ruby-2.3.0/gems/bootstrap-sass-3.3.6/assets"
  " let g:syntastic_scss_sass_args="--load-path ~/.rvm/gems/ruby-2.3.0/gems/bootstrap-sass-3.3.6/assets"
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_html_tidy_ignore_errors=["trimming empty <"]

" Delete current file
" -------------------------
  map <Leader>df :call delete(expand('%')) \| bdelete!<CR>"

" Remove Highlighted Search
" ------------------------
  map <Leader>nh :nohl  \| echo 'finished high lighting'<CR>


" Leader mapping for git
" --------------------
  map <Leader>gd :Gdiff<CR>
  map <Leader>gs :Gstatus<CR>
  map <Leader>gc :Gcommit<CR>
  map <Leader>gb :Gbrowse<CR>
  map <Leader>ga :Gwrite<CR>
  map <Leader>gr :Git reset HEAD %<CR>
  map <Leader>gx :Git checkout %<CR>
  map <Leader>ge :Gread<CR>
  map <Leader>gp :Dispatch! git push<CR>
  map <Leader>gl :Dispatch! git pull<CR>
  map <Leader>gb :Git checkout -b<Space>

" Escape faster
" ------------------------
  set timeoutlen=1000 ttimeoutlen=0

" Fzf
" ------------------------
  nnoremap <C-p> :FZF<CR>
  nnoremap <Leader>f :Ag<Space>

" Vim.rspec
" -----------------------
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
  let g:rspec_command = 'call Send_to_Tmux("zeus test {spec}\n")'

" Tabs
" -----------------------
  nnoremap th  :tabfirst<CR>
  nnoremap tj  :tabnext<CR>
  nnoremap tk  :tabprev<CR>
  nnoremap tl  :tablast<CR>
  nnoremap tt  :tabedit<Space>
  nnoremap tn  :tabnew<Space>
  nnoremap tm  :tabm<Space>
  nnoremap td  :tabclose<CR>


" Mina deploy
" -----------------------
  nnoremap <leader>md :!mina deploy<cr>

" Ctags
" -----------------------
  let g:vim_tags_auto_generate = 1

" Easy align
" -----------------------
  " Start interactive EasyAlign in visual mode (e.g. vipea)
  xmap ea <Plug>(EasyAlign)

" Easy Ctags
" -----------------------
  " Set Async True
  let g:easytags_async =  1
  let g:easytags_auto_update = 1
