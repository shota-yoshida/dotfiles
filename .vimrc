if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))
  call dein#add('Shougo/dein.vim')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('gregsexton/gitv')
  call dein#add('flyinshadow/php_localvarcheck.vim')
  call dein#add('jistr/vim-nerdtree-tabs')
"  call dein#add('jszakmeister/vim-togglecursor')
"  call dein#add('maksimr/vim-jsbeautify')
  call dein#add('scrooloose/nerdtree')
"  call dein#add('shota-yoshida/moveline')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('soramugi/auto-ctags.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-splash')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tomasr/molokai')
  call dein#add('tpope/vim-fugitive')
"  call dein#add('vim-airline/vim-airline')
  call dein#add('w0rp/ale')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('nazo/pt.vim')

  call dein#end()
  call dein#save_state()
endif

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
set tags=./.git/.tags;
set ignorecase
set smartcase
set hlsearch
set noswapfile
set clipboard&
set clipboard^=unnamedplus
set nocompatible
set synmaxcol=480
set helplang& helplang=ja
set history=1000
syntax enable
filetype plugin indent on
let is_bash=1

"##################################
" defalt key mapping
"##################################
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

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
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"==================================
" Shougo/neocomplete
"==================================
let g:neocomplete#enable_at_startup = 1
let g:neocomplete_php_locale = 'ja'

"==================================
" Shougo/neosnippet
"==================================
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/snippets'

"==================================
" scrooloose/nerdtree
"==================================
map <C-e> <plug>NERDTreeTabsToggle<CR>
nnoremap <C-l> gt
nnoremap <C-h> gT

"==================================
" soramugi/auto-ctags
"==================================
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --regex-php=\"/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i\"'
"show tag list
nnoremap <C-]> g<C-]>

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

"==================================
" flyinshadow/php_localvarcheck.vim
"==================================
let g:php_localvarcheck_enable = 1
let g:php_localvarcheck_global = 0

"==================================
" terryma/vim-multiple-cursors
"==================================
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"==================================
" thinca/vim-splash
"==================================
let g:splash#path = $HOME."/.vim/dein/repos/github.com/thinca/vim-splash/sample/vim_intro.txt"
