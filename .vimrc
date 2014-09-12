" vi との互換性OFF
set nocompatible
filetype off

"---------------------------------------------------------------------------
" NeoBundle
"---------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'wesleyche/SrcExpl.git'
NeoBundle 'wesleyche/Trinity.git'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'scrooloose/syntastic'

"---------------------------------------------------------------------------
" editor setting
"---------------------------------------------------------------------------
syntax on
" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
" ファイルタイプ別 {{{
"autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
"autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
" }}}

set number
set ruler
set laststatus=2
set t_Co=256
set mouse=a
set backspace=indent,eol,start
set ignorecase
set smartcase
set directory-=.
set autoread
set showcmd
set incsearch
set hlsearch
set smartindent

" grep,vimgrep,Ggrep時にquickfix-windowを開くようにする
autocmd QuickFixCmdPost *grep* cwindow
" ファイルを開くたびに、そのファイルのディレクトリに移動する
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" # の行で改行したときなどに # をつけないように
autocmd FileType * setlocal formatoptions-=r
autocmd FileType * setlocal formatoptions-=o

" 保存時に行末の空白削除およびタブを空白に変換する
function! s:remove_dust(replace_space_str)
    let cursor = getpos(".")
    %s/\s\+$//ge
    execute '%s/\t/'.a:replace_space_str.'/ge'
    call setpos(".", cursor)
    unlet cursor
endfunction
"autocmd BufWritePre *.php call <SID>remove_dust('    ')

" ctags
set tags=./.tags,./../.tags,./*/.tags,./../../.tags,./../../../.tags,./../../../../.tags,./../../../../../.tags

" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

nnoremap qq :q!<CR> " 保存せずに閉じる

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

"---------------------------------------------------------------------------
" タブスペース系
"---------------------------------------------------------------------------
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

"---------------------------------------------------------------------------
" コピペ系
"---------------------------------------------------------------------------
set clipboard+=unnamed
set clipboard+=autoselect

source ~/.vimrc.bundles
