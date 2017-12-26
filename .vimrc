
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/mao/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/mao/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/Unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-smartinput')
call dein#add('rhysd/vim-operator-surround')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tyru/caw.vim.git')
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set number

set autoindent smartindent
set shiftwidth=2
set softtabstop=2

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" colorscheme desert
colorscheme molokai
let g:rehash256 = 1
autocmd ColorScheme * highlight LineNr ctermfg=172
set background=dark
syntax enable


nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

autocmd BufWritePre * :%s/\s\+$//ge
