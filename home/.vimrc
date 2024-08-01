" ---------- Vi compatible (~/.exrc) -----------------------

" set autoindent
" set expandtab
" set tabstop=4
" set ignorecase
" set autowrite
" set nonumber
" set ruler
" set showmode
" set noflash

" ---------- Important: ------------------------------------
"        Designed for Vim 8+

if !has('eval') " vim-tiny lacks eval
  echo "vim-tiny detected"
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

set nocompatible        " Don't make vim vi-compatible
let skip_defaults_vim=1 " Skip defaults.vim

filetype plugin indent on
if !exists('g:syntax_on') | syntax enable | endif

map <space> <nop>
map <BS> <nop>

" Leaderkey
let g:mapleader=' '
let g:maplocalleader=' '

" Performance
set updatecount=0
" set updatetime=50
set updatetime=0
set ttimeoutlen=0
set notimeout
" set nottimeout
set ttimeout
set autowrite
set lazyredraw
set noshowcmd
set noshelltemp
set noesckeys

let undo_dir = expand('~/.vim/undo')
if !isdirectory(undo_dir)
  call mkdir(undo_dir, 'p')
endif

" Undo, backup, swap, viminfo
set undodir=~/.vim/undo//
set viminfofile=~/.vim/viminfo
set undofile
set undolevels=10000
set nobackup
set writebackup
set noswapfile
set viminfo='20,<1000,s1000

" Encoding
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set fixendofline
set foldmethod=manual
set nofoldenable

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set breakindent
set cinoptions+=:0

" UI
set nowrap
set wrapscan
set wildmenu
set wildignore+=tmp/*,*.so,*.swp,*.zip
set mouse=
set ignorecase
set smartcase
set conceallevel=0
set number
set norelativenumber
set nrformats=bin,hex
set signcolumn=no
set pumheight=6
set textwidth=72
set scrolloff=0
set display=lastline
set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

" Status line
set laststatus=1
set ruler
set rulerformat=%30(%=%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set showmode
set shortmess=aoOtTI
" set shortmess=aoOtTWIcC

set viewoptions=folds,cursor,curdir,unix,slash
let g:vimsyn_embed='lmpPrt'
set nospell
set spellcapcheck=
set noflash
set hidden
set hlsearch
set incsearch
set linebreak
set ttyfast
set history=100
set omnifunc=syntaxcomplete#Complete
set noerrorbells
set visualbell
set t_vb=
set backspace=indent,eol,start
set noshowmatch
" set colorcolumn+=1
" let g:loaded_matchparen=1
" set nolangremap

" Theme
" set background=dark
" set termguicolors
" set t_Co=256
" set t_Co=16
" set t_Co=8
" set t_md=
" set t_ZH=
set background=light
colorscheme custom
let c_comment_strings=1

" Color overrides
autocmd FileType markdown,pandoc highlight Title ctermfg=yellow ctermbg=NONE
autocmd FileType markdown,pandoc highlight Operator ctermfg=black ctermbg=NONE
autocmd FileType yaml highlight yamlBlockMappingKey ctermfg=NONE
highlight markdownBlockquote ctermfg=8
highlight MarkdownQuote ctermfg=12
autocmd FileType markdown,pandoc match MarkdownQuote '^>.*$'

highlight TrailingWhitespace ctermfg=NONE ctermbg=8
match TrailingWhitespace /\s\+$/

" Cursor
" let &t_SI='\e[3 q'
" let &t_SR='\e[3 q'
" let &t_EI='\e[3 q'
" autocmd VimEnter * silent !echo -ne '\e[3 q'

" ---------- Plugins ---------------------------------------
"  (github.com/junegunn/vim-plug)

let data_dir = expand('~/.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.local/share/vim/plug')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jasonccox/vim-wayland-clipboard'
    " Plug 'yorickpeterse/happy_hacking.vim'
  call plug#end()
endif

" CtrlP
let g:ctrlp_map='<Leader>e'
" let g:ctrlp_working_path_mode='rw'
let g:ctrlp_working_path_mode='w'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore={
          \ 'dir': '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }

" undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" ale
let g:ale_sign_error='E'
let g:ale_sign_warning='W'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'
let g:ale_floating_window_border=repeat([''], 8)
let g:ale_set_signs=0
let g:ale_linters={'python': ['flake8'], 'go': ['golangci-lint', 'gofmt', 'gobuild']}

" netrw
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

let g:tex_conceal='abdgms'

" ---------- Filetype specific -----------------------------

autocmd FileType markdown,pandoc,asciidoc,asciidoctor setlocal textwidth=0
autocmd FileType yaml setlocal shiftwidth=2
" autocmd FileType sh,bash setlocal shiftwidth=2
" autocmd FileType c setlocal shiftwidth=2
" autocmd FileType go setlocal shiftwidth=2
" autocmd FileType asm setlocal shiftwidth=4
" autocmd FileType vim setlocal shiftwidth=2 expandtab
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor noremap j gj
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor noremap k gk
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor noremap 0 g0
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor noremap $ g$
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor setlocal wrap
" autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor setlocal shiftwidth=2
autocmd FileType markdown,txt,pandoc,asciidoc,asciidoctor setlocal conceallevel=0
autocmd FileType sh,bash,go,sshconfig,gitconfig setlocal noexpandtab

" Force some files to be specific file type
autocmd BufNewFile,BufRead user-data,metadata,keg setlocal filetype=yaml
autocmd BufNewFile,BufRead *.ddl setlocal filetype=sql
autocmd BufNewFile,BufRead *.bash* setlocal filetype=sh
autocmd BufNewFile,BufRead *.{peg,pegn} setlocal filetype=config
autocmd BufNewFile,BufRead *.gotmpl setlocal filetype=go
autocmd BufNewFile,BufRead .profile setlocal filetype=sh
autocmd BufNewFile,BufRead *.crontab setlocal filetype=crontab
autocmd BufNewFile,BufRead *ssh/config setlocal filetype=sshconfig
autocmd BufNewFile,BufRead .dockerignore setlocal filetype=gitignore
autocmd BufNewFile,BufRead *.s,*.S setlocal filetype=arm
autocmd BufNewFile,BufRead *gitconfig setlocal filetype=gitconfig
autocmd BufNewFile,BufRead /tmp/psql.edit.* setlocal syntax=sql

" Make sure no leak when editing secret files
augroup secretEdit
  autocmd!
  autocmd BufNewFile,BufRead /tmp/pass*,
              \/private/**/pass*,
              \/run/**/1000/pass*
              \/tmp/gopass*,
              \/private/**/gopass*,
              \/dev/shm/gopass*,
              \/run/**/1000/gopass*,
              \/dev/shm/passage*,
              \ setlocal noswapfile nobackup noundofile viminfo=
augroup END

" Force loclist to always close when buffer does (affects vim-go, etc.)
augroup closeLoclistWindow
  autocmd!
  autocmd QuitPre *
              \ if empty(&buftype) |
              \     lclose |
              \ endif
augroup END

" Return to last edit position when opening files
augroup returnPosition
  autocmd!
  autocmd BufReadPost *
              \ let line = line("'\"")
              \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
              \       && index(['xxd', 'gitrebase'], &filetype) == -1
              \ |     execute "normal! g`\""
              \ | endif
augroup END

" Make Y consistent with D and C (yank til end)
map Y y$

" Disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

nnoremap <Leader>l :set list!<CR>
nnoremap - :Explore<CR>

" Indent in visual mode
vnoremap < <gv
vnoremap > >gv

" Workaround foot bug: https://github.com/vim/vim/issues/9014
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4m"

" Source local configuration file if available
if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

" vim: expandtab shiftwidth=2
