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

"---------------------------------------------------------------------------
" tab setting
"---------------------------------------------------------------------------

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
