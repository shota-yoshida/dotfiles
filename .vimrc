set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

call dein#add('airblade/vim-gitgutter')
call dein#add('gregsexton/gitv')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('tomasr/molokai')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('w0rp/ale')
call dein#add('Xuyuanp/nerdtree-git-plugin')


"##################################
" basic
"##################################
set number
set list
set listchars=tab:›\ 
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab
set wildmenu
set ruler
set tag=~/php.tags
set ignorecase
set smartcase
set hlsearch
set noswapfile
set clipboard&
set clipboard^=unnamedplus
set nocompatible
set synmaxcol=480
set helplang& helplang=ja
syntax enable
let is_bash=1


"##################################
" color
"##################################
autocmd colorscheme molokai highlight Visual ctermbg=10
colorscheme molokai


"##################################
" Highlight Space
"##################################
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


"##################################
" plugins
"##################################

""==================================
" w0rp/ale
"==================================
let g:ale_php_phpcs_standard="PSR2"

"==================================
" Shougo/neocomplete
"==================================
let g:neocomplete#enable_at_startup = 1
let g:neocomplete_php_locale = 'ja'

"==================================
" Shougo/neosnippet
"==================================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/snippets'

"==================================
" scrooloose/nerdtree
"==================================
map <C-e> <plug>NERDTreeTabsToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

"==================================
" soramugi/auto-ctags
"==================================
let g:auto_ctags = 1
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
let Tlist_Ctags_Cmd='ctags'

"==================================
" jszakmeister/vim-togglecursor
"==================================
let g:togglecursor_force='xterm'

"==================================
" maksimr/vim-jsbeautify
"==================================
if executable('js-beautify')
  command! -range=% -nargs=* HTMLTidy <line1>,<line2>call RangeHtmlBeautify()
  command! -range=% -nargs=* JSTidy <line1>,<line2>call RangeJsBeautify()
  command! -range=% -nargs=* CSSTidy <line1>,<line2>call RangeCSSBeautify()
  command! -range=% -nargs=* JSONTidy <line1>,<line2>call RangeJsonBeautify()
endif
