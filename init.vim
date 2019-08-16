filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
syntax on
colorscheme molokai
set number
set noerrorbells
set autoindent
set cindent
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set nocompatible
"set cursorline
set wrap
set wildmenu
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
noremap = nzz
noremap - Nzz
map <LEADER>m :nohlsearch<CR>
noremap j h
noremap i k
noremap k j
noremap h i
noremap K 5j
noremap I 5k
noremap H I
noremap <LEADER><CR> :vsplit<CR>
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map t :tabe<CR>
map tn :+tabnext<CR>
map tp :-tabnext<CR>
map S :w<CR>
map s <nop>
map Q :q<CR>
" Compile function
map r :call Compilemd()<CR>
func! Compilemd()
  exec "w"
  exec "MarkdownPreview"
endfunc

call plug#begin('~/.config/nvim/plugged')
"vimwiki
Plug 'vimwiki/vimwiki'
"/vim-table-mode
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }
"vim-colorschemes
Plug 'flazz/vim-colorschemes'
"CPP syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'
"rainbow
Plug 'luochen1990/rainbow'
"vim-airline
Plug 'vim-airline/vim-airline'
"vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
"auto-pairs
Plug 'jiangmiao/auto-pairs'
"completeparameter
Plug 'tenfyzhong/CompleteParameter.vim'
"nerdtree
Plug 'scrooloose/nerdtree'
"vim-nerdtree-syntax-highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
"tagbar
Plug 'majutsushi/tagbar'
"nerdcommenter
Plug 'scrooloose/nerdcommenter'
"ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-pyclang'
"language sercer
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'zsh install.sh',
    \ }
"syntastic
Plug 'vim-syntastic/syntastic'
"vim-snazzy
"Plug 'connorholyday/vim-snazzy'
"vim-monokai
Plug 'sickill/vim-monokai'
call plug#end()


"cpp highlight configuration
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_no_function_highlight = 1

"rainbow active
let g:rainbow_active = 1

"airline-theme
"let g:airline_theme='atomic'

"complete_parameter
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter))


"nerdtree
nnoremap <silent><leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName    = 1
let g:NERDTreeExactMatchHighlightFullName       = 1
let g:NERDTreePatternMatchHighlightFullName     = 1
let g:NERDTreeHighlightFolders                  = 1
let g:NERDTreeHighlightFoldersFullName          = 1
let g:NERDTreeDirArrowExpandable                = '▷'
let g:NERDTreeDirArrowCollapsible               = '▼'

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
"tagbar
let g:tagbar_width = 30
nnoremap <silent><leader>t :TagbarToggle<cr>

"nerdcommenter
let g:NERDSpaceDelims               = 1
let g:NERDCompactSexyComs           = 1
let g:NERDDefaultAlign              = 'left'
let g:NERDCommentEmptyLines         = 1
let g:NERDTrimTrailingWhitespace    = 1
let g:NERDToggleCheckAllLines       = 1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()


"IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

nnoremap <C-b>  <Esc>:w<CR>:!g++ -std=c++11 % -Wall -o %< && xfce4-terminal<CR>
nnoremap <C-c>  <Esc>:w<CR>:!g++ -std=c++11 % -Wall -o %<<CR>
"nnoremap <C-g>  <Esc>:w<CR>:!g++ -std=c++11 -g % -Wall -o %.out && gdb %.out<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" My snippits
source ~/.config/nvim/snippits.vim

" ===
" " === vim-table-mode
" " ===
map <LEADER>ig :TableModeToggle<CR>

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
