" Ensure vi compatability is off and avoid side-effects when
" nocompatible has already been set.
if &compatible
  set nocompatible
endif

" Create undo directory if it does not exist yet.
if !isdirectory(expand('~/.vim/undo'))
  call mkdir(expand('~/.vim/undo'), 'p', 0700)
endif

" Configure undo and viminfo settings.
set undofile
set undodir=~/.vim/undo//
set undolevels=10000
set viminfofile=~/.vim/viminfo
set viminfo='20,<1000,s1000

" Disable swap and backup files.
set noswapfile
set nobackup

" Performance
set notimeout
set ttimeout
set ttimeoutlen=0
set autowrite
set lazyredraw
set noshowcmd
set noshelltemp
set noesckeys

" Encoding
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set fixendofline
set foldmethod=manual
set nofoldenable

" Indentation and formatting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set breakindent

" UI
set display=lastline
set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
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
set scrolloff=0

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

" Leaderkey
let g:mapleader=' '
let g:maplocalleader=' '

map <space> <nop>
map <BS> <nop>

" Bootstrap plug.vim
let data_dir = expand('~/.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin()
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'conradirwin/vim-bracketed-paste'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jasonccox/vim-wayland-clipboard'
  " Plug 'yorickpeterse/happy_hacking.vim'
  call plug#end()
endif

filetype plugin indent on
syntax enable

set background=light
silent! colorscheme custom

autocmd FileType markdown,pandoc highlight Title ctermfg=yellow ctermbg=NONE
autocmd FileType markdown,pandoc highlight Operator ctermfg=black ctermbg=NONE
autocmd FileType yaml highlight yamlBlockMappingKey ctermfg=NONE
highlight markdownBlockquote ctermfg=8
highlight MarkdownQuote ctermfg=12
autocmd FileType markdown,pandoc match MarkdownQuote '^>.*$'

highlight TrailingWhitespace ctermfg=NONE ctermbg=8
match TrailingWhitespace /\s\+$/

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
let g:ale_linters={'sh': ['shellcheck']}

" netrw
let g:netrw_banner=0
let g:netrw_preview=1
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
