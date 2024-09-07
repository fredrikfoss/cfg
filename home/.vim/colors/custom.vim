" Vim color file --- main (personal)
"
" Note: Please set the background option in your .vimrc
"
"     It is much better *not* to set `background` option inside
"     a colorscheme file, because `:set background` improperly may
"     cause colorscheme be sourced twice

" Color Scheme Overview:
"     :ru syntax/hitest.vim

highlight clear

if exists("syntax_on")
  syntax reset
endif

if &t_Co!=16
  set t_Co=16
endif

if &t_md!=""
  set t_md=
endif

if &t_ZH!=""
  set t_ZH=
endif

let g:colors_name=expand("<sfile>:t:r")

" In diffs, added lines are green, changed lines are yellow, deleted
" lines are red, and changed text (within a changed line) is bright
" yellow and bold
highlight DiffAdd                    ctermfg=0 ctermbg=2
highlight DiffChange                 ctermfg=0 ctermbg=3
highlight DiffDelete                 ctermfg=0 ctermbg=1
highlight DiffText                   ctermfg=0 ctermbg=11 cterm=bold

" End of buffer
highlight link EndOfBuffer           LineNr

" Statusline and vert split
highlight StatusLine                 ctermfg=15 ctermbg=8 cterm=bold
highlight StatusLineNC               ctermfg=7 ctermbg=8 cterm=NONE
highlight VertSplit                  ctermfg=8 ctermbg=8 cterm=NONE

" Search
highlight Search                     ctermfg=0 ctermbg=11
highlight IncSearch                  ctermfg=0 ctermbg=15 cterm=NONE
highlight Visual                     ctermfg=NONE ctermbg=NONE cterm=inverse

" LineNr
highlight LineNr                     ctermfg=7
highlight CursorLineNr               ctermfg=7

" Pmenu
" highlight Pmenu                      ctermfg=NONE ctermbg=NONE cterm=inverse
" highlight PmenuSel                   ctermfg=11 ctermbg=NONE cterm=inverse
highlight Pmenu                      ctermfg=15   ctermbg=8
highlight PmenuSel                   ctermfg=8    ctermbg=15

" highlight Comment                    ctermfg=8
highlight Comment                    ctermfg=7
highlight ColorColumn                ctermfg=7 ctermbg=8
highlight Folded                     ctermfg=7 ctermbg=8
highlight FoldColumn                 ctermfg=7 ctermbg=8
highlight SpellCap                   ctermfg=1 ctermbg=NONE
highlight SpellBad                   ctermfg=1 ctermbg=NONE
highlight SpellRare                  ctermfg=1 ctermbg=NONE
highlight SignColumn                 ctermbg=NONE
highlight Error                      ctermfg=1 ctermbg=NONE
highlight ErrorMsg                   ctermfg=1 ctermbg=NONE
highlight Todo                       ctermfg=11 ctermbg=NONE
highlight WarningMsg                 ctermfg=2 ctermbg=NONE
highlight Warning                    ctermfg=2 ctermbg=NONE
highlight MatchParen                 ctermfg=15 ctermbg=4 cterm=bold
highlight markdownCode               ctermfg=6
" highlight markdownCode               ctermfg=14
highlight link markdownCodeDelimiter Comment
highlight link markdownCodeBlock markdownCode
highlight markdownListMarker         ctermfg=5
highlight link markdownOrderedListMarker markdownListMarker
highlight link markdownHeadingDelimiter Title
highlight markdownBlockquote         ctermfg=8
highlight MarkdownQuote              ctermfg=12
highlight markdownItalic             ctermfg=12
highlight link markdownItalicDelimiter Comment
highlight markdownBold               ctermfg=9
highlight link markdownBoldDelimiter Comment
highlight markdownBoldItalic         ctermfg=9
highlight link markdownBoldItalicDelimiter Comment
highlight markdownLinkText           ctermfg=2
highlight markdownAutomaticLink      ctermfg=10
highlight markdownUrl                ctermfg=10
highlight markdownUrlTitle           ctermfg=2
highlight markdownUrlDelimiter       ctermfg=10
highlight markdownRule               ctermfg=15

" Plugin highlights                    cterm" Plugin highlights
highlight ALEError                   ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEWarning                 ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEInfo                    ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEStyleError              ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEStyleWarning            ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextError        ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextWarning      ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextInfo         ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextStyleError   ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextStyleWarning ctermfg=1 ctermbg=NONE cterm=NONE
