set number
set list
set listchars=tab:›\ 
set softtabstop=2
set shiftwidth=2
set smartindent
set expandtab
set wildmenu
set ruler
set tag=~/git/tags
set ignorecase
set smartcase
set hlsearch
set noswapfile
set clipboard&
set clipboard^=unnamedplus
set nocompatible
set synmaxcol=250
set helplang& helplang=ja

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('scrooloose/syntastic')
call dein#add('mhinz/vim-signify')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('kana/vim-fakeclip')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-endwise')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('godlygeek/tabular')
call dein#add('elzr/vim-json')
call dein#add('embear/vim-localvimrc')

call dein#end()

nnoremap <silent><C-e> :NERDTreeFind<CR>

" if you call syntax enable after dein doing, syntax disabled
syntax enable

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" ctag
let g:auto_ctag = 1

" rubocop
let g:syntastic_ruby_checkers = ['rubocop']

" togglecursor
let g:togglecursor_force='xterm'

" vim-multiple-cursors
let g:multi_cursor_next_key='<C-n>'

" vim-localvimrc
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" vim-json
if dein#tap('vim-json')
  let g:vim_json_syntax_conceal = 0
endif
