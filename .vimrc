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
NeoBundle 'Shougo/neocomplcache.git' 
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'honza/snipmate-snippets.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/unite.git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'

"NeoBundle 'http://conque.googlecode.com/svn/trunk/', {'directory' :"'conqueterm'}
"Bundle 'git://git.wincent.com/command-t.git'

"---------------------------------------------------------------------------
" vim-quickrun
"---------------------------------------------------------------------------
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}
let g:quickrun_config['_'] = {
  \ 'outputter/buffer/into' : 1,
  \ 'runner' : 'vimproc'
  \ }
let g:quickrun_config['rspec/bundle'] = {
  \ 'type' : 'rspec/bundle',
  \ 'command' : 'rspec',
  \ 'exec' : 'bundle exec %c %s',
  \ 'outputter/buffer/filetype' : 'rspec-result',
  \ 'split' : ''
  \ }
let g:quickrun_config['rspec/normal'] = {
  \ 'type' : 'rspec/normal',
  \ 'command' : 'rspec',
  \ 'exec' : '%c %s',
  \ 'outputter/buffer/filetype' : 'rspec-result',
  \ 'split' : ''
  \ }
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/normal'}
  " let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction

augroup QrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

autocmd BufReadPost *_spec.rb call RSpecQuickrun()
" ウィンドウを下に開く
set splitbelow
nmap <Leader>r <plug>(quickrun)

"---------------------------------------------------------------------------
" vim-pathogen
"---------------------------------------------------------------------------
call pathogen#runtime_append_all_bundles()

"---------------------------------------------------------------------------
" neocomplcache
"---------------------------------------------------------------------------
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"---------------------------------------------------------------------------
" unite
"---------------------------------------------------------------------------
" バッファ一覧を表示
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧を表示
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイル一覧を表示
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧表示
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ESCキー2回押すと終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"---------------------------------------------------------------------------
" editor setting
"---------------------------------------------------------------------------
syntax on
" vi との互換性OFF  
set nocompatible
" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set softtabstop=2
