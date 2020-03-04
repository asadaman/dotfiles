if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_dir)
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/unite-outline')
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
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Quramy/tsuquyomi')
  call dein#add('mattn/emmet-vim')
  call dein#add('fatih/vim-go', { 'on_ft': 'go' })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------


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

set background=dark
syntax enable
colorscheme iceberg
let g:rehash256 = 1
autocmd ColorScheme * highlight LineNr ctermfg=172

nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=gray
hi IndentGuidesEven ctermbg=darkgrey

autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufRead,BufNewFile *.slim setfiletype slim
autocmd BufRead,BufNewFile *.ts setfiletype typescript
autocmd BufRead,BufNewFile *.tsx setfiletype typescript

" setting for denite
call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('file_rec', 'command', ['pt', '--follow', '--nocolor', '--nogroup', '-g', ''])
" denite時に使用するキーマップ
" ESCキーでdeniteを終了
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
" C-N,C-Pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" C-J,C-Kでsplitで開く
call denite#custom#map('insert', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:do_action:vsplit>', 'noremap')

" 以下はdenite起動時に使用するキーマップ
" バッファ一覧
noremap <C-B> :Denite buffer<CR>
" ファイル一覧
noremap <C-F> :Denite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Denite file_old<CR>
" カレントディレクトリ
noremap <C-C> :Denite file_rec<CR>
" バッファ一覧
nnoremap sB :<C-u>Denite buffer -buffer-name=file<CR>

" Denite でバッファ内検索
nnoremap <silent> <Leader><C-f> :<C-u>Denite line<CR>
nnoremap <silent> <expr><Space>l ":<C-u>DeniteWithCursorWord line<CR>"

" Goの設定
let g:go_fmt_autosave=1
let g:go_auto_type_info=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_auto_sameids=1
let g:go_fmt_command='goimports'
let g:go_addtags_transform='snakecase'
let g:go_snippet_engine='neosnippet'
let g:go_list_type='quickfix'
let g:syntastic_go_checkers=['golint', 'govet', 'errcheck', 'go']
