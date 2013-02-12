"---------------------------------------------------------------------------
" NeoBundle
"---------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'

"NeoBundle 'http://conque.googlecode.com/svn/trunk/', {'directory' :"'conqueterm'}
"Bundle 'git://git.wincent.com/command-t.git'

"---------------------------------------------------------------------------
" vim-quickrun
"---------------------------------------------------------------------------
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}
let g:quickrun_config['_'] = {'outputter/buffer/into' : 1,}
" ウィンドウを下に開く
set splitbelow
nmap <Leader>r <plug>(quickrun)

"---------------------------------------------------------------------------
" vim-pathogen
"---------------------------------------------------------------------------
call pathogen#runtime_append_all_bundles()

"---------------------------------------------------------------------------
" editor setting
"---------------------------------------------------------------------------
syntax on
" vi との互換性OFF  
set nocompatible
" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
