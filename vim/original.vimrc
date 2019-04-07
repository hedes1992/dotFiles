" plugin manager settings
" using vim-plug in 2018.09.30
" vim-plug scripts start
" specify a dir for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" my own plugin
" refer to http://codingpy.com/article/vim-and-python-match-in-heaven/
Plug 'tmhedberg/SimpylFold'
let g:SimplyFold_docstring_preview=1    " 看到折叠代码的文档字符串
Plug 'vim-scripts/indentpython.vim'     " 自动缩进, 更符合PEP8
Plug 'Valloric/YouCompleteMe'           " YCM 插件
" for anaconda
let g:ycm_python_interpreter_path = '/mnt/data-1/data/zewen.he/anaconda2/bin/'
let g:ycm_python_sys_path = ['/mnt/data-1/data/zewen.he/anaconda2/pkgs/']
let g:ycm_extra_conf_vim_data = ['g:ycm_python_interpreter_path', 'g:ycm_python_sys_path']
" refer to
" http://pytlab.org/2017/03/26/%E4%BC%98%E9%9B%85%E7%9A%84%E5%9C%A8%E7%BB%88%E7%AB%AF%E4%B8%AD%E7%BC%96%E5%86%99Python/
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
Plug 'scrooloose/syntastic'             " 语法检查
Plug 'nvie/vim-flake8'                  " PEP8代码风格检查
Plug 'scrooloose/nerdtree'              " 文件树形结构
let NERDTreeIgnore=['\pyc$', '\~$']     " 文件树中隐藏pyc等文件
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plug 'jistr/vim-nerdtree-tabs'              " tab键文件树
Plug 'tpope/vim-fugitive'               " git集成
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}   " 状态栏插件
Plug 'bling/vim-airline'    " 用这个状态栏
"Plug 'kien/rainbow_parentheses.vim'     " 不同颜色区分括号匹配
"leg g:rbpt_colorpairs   = [['brown', 'RoyalBlue3'], ['Darkblue','SeaGreen3'],
"                        \ ['darkgray', 'DarkOrchid3'], ['darkgreen','firebrick3'],
"                        \ ['darkcyan', 'RoyalBlue3'], ['darkred','SeaGreen3'],
"                        \ ['darkmagenta', 'DarkOrchid3'], ['brown', 'firebrick3'],
"                        \ ['gray', 'RoyalBlue3'], ['darkmagenta', 'DarkOrchid3'],
"                        \ ['Darkblue', 'firebrick3'], ['darkgreen', 'RoyalBlue3'],
"                        \ ['darkcyan', 'SeaGreen3'], ['darkred', 'DarkOrchid3'],
"                        \ ['red', 'firebrick3'],]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
Plug 'w0rp/ale'     " 不用 synatastic，用这个
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
" 配色方案
Plug 'dracula/vim', {'as':'dracula'}
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
" vim-plug scripts end
" refer to https://zhuanlan.zhihu.com/p/30022074
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
"au Filetype python set textwidth=79 " 输入字符太多，会自动enter当前行，因此注释掉, refer to http://swofford.is-programmer.com/posts/42446.html
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent   " enable code folding
autocmd Filetype python set foldlevel=99        
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorcolumn    " 高亮光标所在的列
set cursorline      " 高亮光标所在的行
" hzw added on 2018.09.29
" refer to https://segmentfault.com/a/1190000000446738
" 关闭兼容模式
set nocompatible
" refer to https://blog.easwy.com/archives/advanced-vim-skills-filetype-on/
filetype plugin on	" 开启文件类型检测, 并加载对应插件
filetype indent on 	" 针对不同文件类型加载不同缩进
" 语法高亮
syntax on

set ruler 		" 显示当前行和列
set number 		" 显示行号
set nu rnu 		" 显示相对行号(当前行为绝对行号)
set showcmd 		" 显示未完成命令
set showmode 		" 显示当前mode

set scrolloff=3 	" 屏幕提前滚动
set backspace=indent,eol,start " 在'缩进位置' '行结束符' '段首' 处也能进行回删动作
set showmatch 		" 输入成对的括号时，跳转并高亮匹配的括号
set matchtime=1 	" 匹配时间为100ms

set hlsearch 		" 开启高亮搜索
set incsearch 		" 开启增量搜索，即时匹配当前输入内容，最后输入回车
set ignorecase 		" 搜索时忽略大小写
set smartcase 		" 搜索自动开启大小写

" expandtab, smarttab, tabstop, softtabstop 讨论的是对TAB的通用处理
" autoindent, smartindent, shiftwidth 讨论的是缩进效果
set expandtab 		" 将 TAB 转为 SPACE
set smarttab 		" 行首自动填充 shiftwidth
"set autoindent 		" 开启自动缩进, 缩进效果受到smartindent的影响
"set smartindent 	" 为缩进行为采用类似c语言的风格
set shiftwidth=4 	" 缩进的空格数
set tabstop=4 		" TAB 字符代表的空格数量
set softtabstop=4 	" 设置为和tabstop一样，删除用TAB得到的空格时，按照这个数值来删除，普通空格还是逐个删除
set list listchars=eol:¬,tab:▸\ ,trail:., 	" list 开启对 制表符 行为空格符 行结束符等特殊符号的回显， listchars进一步控制采用什么字符来显示

set background=dark
colorscheme dracula     " dracula theme
" colorscheme grb256 	" 好看的主题
"if has('gui_running')
"    set background=dark
"    colorscheme solarized
"else
"    colorscheme Zenburn
"endif

highlight Comment       ctermfg=245 guifg=#8a8a8a
highlight NonText       ctermfg=240 guifg=#585858
highlight SpecialKey    ctermfg=240 guifg=#585858

" set mouse=a     " 开启鼠标模式,支持所有mode, refer to https://blog.csdn.net/wzzfeitian/article/details/77005595
"
" vim 自动打开跳到上次的光标位置， refer to
" https://blog.csdn.net/darennet/article/details/44340491
if has('autocmd')
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
endif
