set background=light
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
syntax on
colorscheme define
set number
set cursorline
set noerrorbells
set autoindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set nocompatible
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
nnoremap <CR> o<Esc>
map <LEADER>m :nohlsearch<CR>
noremap se <C-g>
noremap j h
noremap i k
noremap k j
noremap h i
noremap K 5j
noremap I 5k
noremap H I
inoremap <C-j> <Left>
inoremap <C-l> <Right>
noremap <LEADER><CR> :vsplit<CR>
noremap <C-j> <C-w>h
noremap <C-l> <C-w>l
noremap <C-k> <C-w>j
noremap <C-i> <C-w>k
noremap <C-left> :vertical resize-5<CR>
noremap <C-right> :vertical resize+5<CR>
noremap t :tabe<CR>
noremap tn :+tabnext<CR>
noremap tp :-tabnext<CR>
noremap S :w<CR>
map s <nop>
noremap Q :q<CR>
set clipboard+=unnamedplus
" Compile function
noremap r :call CompileRun()<CR>
func! CompileRun()
  exec "w"
  if &filetype == 'tex'
    exec "!xelatex %"
    exec "!epdfview %<.pdf"
  elseif &filetype == "cpp"
    exec "!g++ -std=c++11 % -Wall -o %<"
    set splitbelow
    :sp
    :res -12
    :term ./%<
  elseif &filetype == "c"
    exec "!gcc % -Wall -o %<"
    set splitbelow
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :res -15
    :term python3 %
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  elseif &filetype == 'java'
    exec "!javac %"
    set splitbelow
    :sp
    :res -15
    :term java %<
  endif
endfunc

call plug#begin('~/.config/nvim/plugged')
"cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight'
"LeaderF : efficent search tool
Plug 'Yggdroot/LeaderF'
"auto generate ctag data
Plug 'ludovicchabant/vim-gutentags'
"vim-snippets
Plug 'honza/vim-snippets'
"UltiSnips
Plug 'SirVer/ultisnips'
"ale
Plug 'dense-analysis/ale'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"fzf
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Bookmarks
Plug 'kshenoy/vim-signature'
"tabular
Plug 'godlygeek/tabular'
"SimpylFold
Plug 'tmhedberg/SimpylFold'
"indentline
Plug 'Yggdroot/indentLine'
" Undo Tree
Plug 'mbbill/undotree/'
"vimwiki
Plug 'vimwiki/vimwiki'
"/vim-table-mode
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }
"vim-colorschemes
Plug 'flazz/vim-colorschemes'
"rainbow
Plug 'luochen1990/rainbow'
"vim-airline
Plug 'vim-airline/vim-airline'
"vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
"auto-pairs
Plug 'jiangmiao/auto-pairs'
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
"language sercer
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'zsh install.sh',
    \ }
call plug#end()

"rainbow active
let g:rainbow_active = 1

"airline-theme
let g:airline_theme='light'

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

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_bruowser = 'chromium'
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
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
"autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

let g:airline_powerline_fonts = 1

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Undotree
" ===
map L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" ===
" === indentLine
" ===
let g:indentLine_char = '¦'
let g:indentLine_color_term = 245
let g:indentLine_color_gui = 'F3F3F3'



" ===
" === FZF
" ===
map <leader>f :FZF<CR>

"Coc Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

let g:tex_flavor = "latex"

"ale config
let g:ale_sign_error = 'X'
let g:ale_sign_warning = 'w'
let g:ale_statusline_format = ['✗ 5%d','✹ %d','✔︎ OK',]
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leavel = 1
let g:ale_c_gcc_options = '-Wall -02 -std=c99'
let g:ale_cpp_gcc_options = '-Wal -02 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/']

let g:gutentags_add_default_project_roots = 0

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root']

" " 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

if isdirectory("kernel/") && isdirectory("mm/")
    let g:gutentags_file_list_command = 'find arch/arm* arch/riscv block crypto drivers fs include init ipc kernel lib mm net security sound virt'
endif

" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" search word under cursor, the pattern is treated as regex, and enter normal
" mode directly
noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR>
highlight Lf_hl_rgHighlight guifg=#000000 guibg=#CCCC66 ctermfg=green ctermbg=185
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match0 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match1 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match2 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match3 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_match4 gui=bold guifg=Blue cterm=bold ctermfg=green
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=green

" cpp highlight
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
