call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set autoread
set background=dark
set cmdheight=2
set complete-=i
set completeopt=noinsert,menuone,noselect
set dictionary=/usr/share/dict/words
set directory^=$HOME/.local/share/nvim/swap//
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set mouse=a
set nobackup
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F2>
set path+=**
set shiftwidth=4
set softtabstop=4
set spelllang=en,ru
set tabstop=4
set tags=./tags,tags
set termguicolors
set updatetime=300
set wildignorecase
set wildmenu

let g:LastTab = 1
let g:LostTab = 1

let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"

let g:coc_disable_startup_warning = 1

let g:ale_linters = {
  \ 'php': ['php'],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ }
let g:ale_fix_on_save = 1

let g:lightline = {
  \ 'colorscheme': 'molokai',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ },
  \ }

let g:rehash256 = 1

function! GitPushUpstream()
    execute 'Git push -u origin ' . fugitive#Head()
endfunction

autocmd TabLeave * let g:LostTab = g:LastTab | let g:LastTab = tabpagenr()
autocmd TabClosed * let g:LastTab = g:LostTab

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" fzf
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
nnoremap ,,c :BCommits<CR>
nnoremap ,,l :BLines<CR>
nnoremap ,,t :BTags<CR>
nnoremap ,/ :History/<CR>
nnoremap ,: :History:<CR>
nnoremap ,? :GFiles?<CR>
nnoremap ,a :Ag<CR>
nnoremap ,b :Buffers<CR>
nnoremap ,c :Commits<CR>
nnoremap ,f :Files<CR>
nnoremap ,g :GFiles<CR>
nnoremap ,h :History<CR>
nnoremap ,l :Lines<CR>
nnoremap ,m :Marks<CR>
nnoremap ,s :Snippets<CR>
nnoremap ,t :Tags<CR>
nnoremap ,w :Windows<CR>

" helpers
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>c :set ignorecase!<CR>
nnoremap <leader>ca <Plug>(coc-codeaction)
nnoremap <leader>co :Git checkout<Space>
nnoremap <leader>fp :Git fetch -p<CR>
nnoremap <leader>fx :!eslint --fix %<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>I <Plug>(coc-implementation)
nnoremap <leader>K call CocAction('doHover')
nnoremap <leader>n :set number!<CR>
nnoremap <leader>N :set relativenumber!<CR>
nnoremap <leader>o <Plug>(coc-definition)
nnoremap <leader>O <Plug>(coc-type-definition)
nnoremap <leader>pl :Git pull<CR>
nnoremap <leader>ps :Git push<CR>
nnoremap <leader>pu :call GitPushUpstream()<CR>
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>R <Plug>(coc-references)
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>vd :Gvd!<CR>
nnoremap <leader>z :bufdo bdelete<CR>
nnoremap <silent> <c-0> :tablast<CR>
nnoremap <silent> <c-space> :exe "tabnext ".g:LastTab<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
vnoremap // y/\V<C-R>"<CR>

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

colorscheme molokai
