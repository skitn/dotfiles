"---------------------------------------------------------------------------
" NeoBundle
"---------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache.git' 
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'honza/snipmate-snippets'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'scrooloose/nerdtree.git'

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
" neosnippet
"---------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1

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
" 入力モードで開始する
let g:unite_enable_start_insert=1

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
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

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
