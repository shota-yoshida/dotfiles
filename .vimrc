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
set synmaxcol=480
set helplang& helplang=ja

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('w0rp/ale')
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
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')
call dein#add('tomasr/molokai')
call dein#add('thinca/vim-quickrun')
call dein#end()

"nnoremap <silent><C-e> :NERDTreeFind<CR>
map <C-e> <plug>NERDTreeTabsToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

" if you call syntax enable after dein doing, syntax disabled
syntax enable

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" ctag
let g:auto_ctag = 1

nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>

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

" neomake
" autocmd! BufWritePost * Neomake

" vim-gitgutter
function! GGDiffAutoDetectSourceBranch(...)
  let l:default_source_branch = 'master'
  if a:1 == ''
    let l:source_branch = l:default_source_branch
  else
    let l:source_branch = a:1
  endif
  let l:diff_against = substitute(system('git merge-base ' . l:source_branch . ' HEAD'), '\n', '', '')
  echom 'diff against: ' . l:diff_against
  let g:gitgutter_diff_base = l:diff_against
  GitGutter
endfunction

function! GGDiff(diff_against)
  let g:gitgutter_diff_base = a:diff_against
  GitGutter
endfunction

command! -nargs=1 GGDiff call GGDiff('<f-args>')
command! -nargs=? GGDiffAutoDetectSourceBranch call GGDiffAutoDetectSourceBranch('<f-args>')

"vim-fugitive
function! GdiffAutoDetectSourceBranch(...)
  let l:default_source_branch = 'master'
  if a:1 == ''
    let l:source_branch = l:default_source_branch
  else
    let l:source_branch = a:1
  endif
  let l:diff_against = substitute(system('git merge-base ' . l:source_branch . ' HEAD'), '\n', '', '')
  echom 'diff against: ' . l:diff_against
  execute 'Gdiff' l:diff_against
endfunction

"php setting
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

command! -nargs=? GdiffAutoDetectSourceBranch call GdiffAutoDetectSourceBranch('<f-args>')

"Bash
let g:is_bash=1

"molokai
autocmd colorscheme molokai highlight Visual ctermbg=10
colorscheme molokai
