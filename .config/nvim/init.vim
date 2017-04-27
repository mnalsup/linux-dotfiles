set nocompatible

set runtimepath+=/home/matthew/.local/share/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/matthew/.local/share/nvim/repos')
		call dein#begin('/home/matthew/.local/share/nvim/repos')

		call dein#add('/home/matthew/.local/share/nvim/repos/github.com/Shougo/dein.vim')
		call dein#add('scrooloose/nerdtree')
		call dein#add('tpope/vim-sensible')
		"call dein#add('neomake/neomake')
		call dein#add('Shougo/denite.nvim')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('w0rp/ale')
    call dein#add('vim-airline/vim-airline')
    call dein#add('flazz/vim-colorschemes')

		"autocomplete https://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
		call dein#add('ervandew/supertab')
		call dein#add('Shougo/deoplete.nvim')
		call dein#add('carlitux/deoplete-ternjs', {'on_ft': ['js', 'jsx'] })
		call dein#add('SirVer/ultisnips')
		call dein#add('honza/vim-snippets')
		call dein#add('ternjs/tern_for_vim', { 'on_ft': [ 'js', 'jsx' ] })
		call dein#add('othree/jspc.vim', {'on_ft': ['js', 'jsx']})
		"conditional by command
		
		"conditional by filetype
    call dein#add('sheerun/vim-polyglot')

		call dein#end()
		call dein#save_state()
endif

"nvim config
set number
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>' use 4 spaces
set shiftwidth=2
" Tab is 4 spaces
set expandtab

"if (has("termguicolors"))
  set termguicolors
"endif

colorscheme jellybeans 

" NERDTree
autocmd VimEnter * NERDTree

"neomake config
"let g:neomake_javascript_enabled_makers = ['eslint']
"autocmd! BufWritePost * Neomake
"ale
filetype off
let &runtimepath.='/home/matthew/.local/share/nvim/repos/github.com/w0rp/ale'
filetype plugin on
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
autocmd bufwritepost *.js silent !standard --fix %
set autoread

"autocomplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [ 'tern#complete', 'jspc#omni' ]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['ultisnips', 'buffer', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" Ctrl+j expands snippets
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" set map leader to ,
let mapleader=","

" vim-javascript config
set conceallevel=1
set cole=1
let g:javascript_conceal_function             = "λ"
let g:javascript_conceal_null                 = "ø"

" nmaps
" neomake
nmap <Leader><Space>o :lopen<CR>
nmap <Leader><Space>c :lclose<CR>
"nmap <Leader><Space>, :ll<CR>
"nmap <Leader><Space>n :lnext<CR>
"nmap <Leader><Space>p :lprev<CR>
"NERDTree
nmap <Leader><Space>f :NERDTree<CR>

"air-line
let g:airline#extensions#tabline#enabled = 1
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['%{ALEGetStatusLine()}',' ','mode'])
endfunction
autocmd VimEnter * call AirlineInit()
