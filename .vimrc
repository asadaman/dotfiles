
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  call dein#begin('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

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
  call dein#add('slim-template/vim-slim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

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
set expandtab

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
autocmd BufRead,BufNewFile *.slim setfiletype slim
