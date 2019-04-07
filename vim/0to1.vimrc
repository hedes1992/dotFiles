" " from http://learnvimscriptthehardway.onefloweroneworld.com/chapters/01.html
" echom ">^.^<"

"call plug#begin('~/.vim/plugged')
"Plug 'dracula/vim', {'as':'dracula'}
" 显示行号, refer to http://learnvimscriptthehardway.onefloweroneworld.com/chapters/02.html

" 设置leader
let mapleader = "\<Space>"
" g: 代表全局变量 参考 https://codeday.me/bug/20171022/90023.html
let g:mapleader = "\<Space>"

" 语法识别
" 不知道和syntax enable的差异是?
" 参考 https://yyq123.blogspot.com/2011/02/vim-syntax.html
syntax on

" 历史长度: how many lines of history VIM has to remember
set history=2000

" 参考 https://blog.easwy.com/archives/advanced-vim-skills-filetype-on/
" 文件类型识别
filetype on
" 文件类别插件
filetype plugin on
" 文件类别相应的indent指定
filetype indent on

""" ****************************** 基本设置

"" 基本
" 不采用和vi兼容的部分, 即采用新的vim特性
set nocompatible
" 当检测到文件在外部被改动后, 而vim本身没做改动时, 自动读取它
" https://ask.helplib.com/vim/post_880393
set autoread
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 正则表达式打开magic, 具体参考 https://charlee.li/vim-regexp.html
set magic
" 改变终端的title, 参考 http://www.mikewootc.com/wiki/tool/sw_develop/vim.html#vim%E8%AE%BE%E7%BD%AE%E7%AA%97%E5%8F%A3title
set title
" 不keep 相应的backup 文件
set nobackup
" 关闭响铃显示, 参考 https://www.cnblogs.com/litifeng/p/5655117.html
set novisualbell
" 关闭错误响铃, 参考 https://stackoverflow.com/questions/18589352/how-to-disable-vim-bells-sounds
set noerrorbells
" 关闭 error beep/flash
set visualbell t_vb=
" 下面两行暂时不管
set t_vb=
set tm=500

"" 外观显示
" 光标移动时上下方至少流出的行数
set scrolloff=3
" 显示光标所在的整列和整行(https://www.jianshu.com/p/b8763c23ea64)
set cursorcolumn cursorline
" 显示光标所在的当前行和列(数字)
set ruler
" 显示当前行号
set number
set nu rnu      " 显示相对行号(当前行为绝对行号)
" 折行, 默认折行, 参考 https://yyq123.blogspot.com/2010/07/vim-wrap.html
set wrap
" 在折行内的移动: 'gj'和'gk' 代表在折行内移动
" normal模式下的非递归映射
nnoremap j (v:count == 0 ? 'gj' : 'j')
nnoremap k (v:count == 0 ? 'gk' : 'k')

" 以下设置的含义基本参考 https://segmentfault.com/a/1190000000446738
" 在屏幕右下角显示未完成的指令输入
set showcmd
" 左下角显示当前模式名称, 常规模式不显示
set showmode
" 输入成对括号时显示匹配的括号, 然后回到括号中间的输入位置
set showmatch
" 将上述的匹配时间设置为100ms, 单位为100ms
set matchtime=1

"" 搜索
" 高亮显示匹配项
set hlsearch
" 增量搜索模式, 实时匹配搜索内容, 最后enter键确认最终的检索词
set incsearch
" 搜索时忽略大小写
set ignorecase
" 如果搜索内容包含大写, 则不忽略大小写
set smartcase

"" tab设置
" 将tab扩展为空格
set expandtab
" 行首tab和行中tab不一致
set smarttab
" 行首tab填入的空格数量
set shiftwidth=4
" 行中tab填入的空格数量
set tabstop=4
" 插入模式下, 保证删除由tab得到的空格也将由这个数量来删除
" 所以一般tabstop和softtabstop保持一致
set softtabstop=4

"" 显示特殊字符的回显
set list listchars=eol:¬,tab:▸\ ,trail:.,

"" 缩进: indent
" 自动缩进
set autoindent
" 为缩进行为采用类似C语言的缩进风格, C本身的缩进方案是 set cindent
set smartindent
" 当缩进不成倍时(即不是tabstop的倍数时), 自动将缩进化零为整, 即自动对齐到以开头开始的tabstop的倍数
set shiftround

"" 折叠 fold
" 暂时注释掉
" set foldenable
" set foldmethod=indent
" set foldlevel=99
" let g:FoldMethod = 0
" map <leader>zz :call ToggleFold()<cr>
" fun! ToggleFold()
"     if g:FoldMethod == 0
"         exe "normal! zM"
"         let g:FoldMethod = 1
"     else
"         exe "normal! zR"
"         let g:FoldMethod = 0
"     endif
" endfun

"" 编码, 参考 http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
" vim内部采用的编码方式
set encoding=utf-8
" 当 Vim 从磁盘上读取文件的时候, 会对文件的编码进行探测
" 如果文件的编码方式和 Vim 的内部编码方式不同, Vim 就会对编码进行转换
" 转换完毕后, Vim 会将 fileencoding 选项设置为文件的编码
" 当 Vim 存盘的时候, 如果 encoding 和 fileencoding 不一样, Vim 就会进行编码转换
" ****************以上是 fileencoding的设置, 这里没有做设置 **********************
" 编码的自动识别是通过设置 fileencodings 实现的, 注意是复数形式
" fileencodings 是一个用逗号分隔的列表, 列表中的每一项是一种编码的名称
" 当我们打开文件的时候, VIM 按顺序使用 fileencodings 中的编码进行尝试解码
" 如果成功的话, 就使用该编码方式进行解码, 并将 fileencoding 设置为这个值
" 如果失败的话, 就继续试验下一个编码。
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" vim用于屏幕显示的编码, 不设置的话和encoding保持一致
set termencoding=utf-8
" unix格式为标准文件格式
set ffs=unix,dos,mac
" 参考 https://www.cnblogs.com/rickyk/p/3839674.html
" 如遇Unicode值大于255的文本, 不必等到空格再折行
set formatoptions+=m
" 合并两行中文时, 不在中间加空格
set formatoptions+=B

"" 补全 select & complete
" 参考 https://www.cnblogs.com/rickyk/p/3839674.html
" 修复ctrl+m多光标操作选择的bug, 但是改变了ctrl+v进行字符选中将包含光标下的字符
set selection=inclusive
" 可以采用鼠标和键盘来选择
set selectmode=mouse,key
" 自动补全配置让Vim补全菜单行为跟IDE一致
set completeopt=longest,menu
" 增强模式中的命令行自动完成操作, 为tab补全增加导航菜单
set wildmenu
" 参考 http://www.yinqisen.cn/blog-729.html
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class

"" 其它
" 方便退格键的使用, 参考 https://www.cnblogs.com/shaojun/archive/2011/01/28/1946632.html
" make that backspace key work the way it should
set backspace=indent,eol,start
" 增加需要作为wrap的符号
set whichwrap+=<,>h,l
" 打开vim, 自动定位到上次打开文件的位置, 需要确认 .viminfo 当前用户可写, 参考 http://www.wklken.me/posts/2016/02/03/some-vim-configs.html
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" NOT SUPPORT
" Enable basic mouse behavior such as resizing buffers.
" set mouse=a

""" ****************************** 主题和状态栏设置
"" 主题
" 主题风格设置为dark
set background=dark
" 主题名称为desert
colorscheme desert
" set mark column color, 设置标记一列的背景颜色和数字一行颜色一致, 参考 https://my.oschina.net/shiftwang/blog/367803
hi! link SignColumn   LineNr
" git diff相关的高亮显示
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" 状态栏显示
" status line
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2   " Always show the status line - use 2 lines for the status bar

""" ****************************** 特别的文件类型
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

"" 自动设置文件开头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " .sh
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    " python
    if &filetype == 'python'
        " 注释掉
        " call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

"" 为已编辑的行删除空格
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

""" ****************************** 键盘映射
" normal模式下不区分折行移动(g*)和真正的跨行移动(*)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 跨window的移动, 分屏窗口切换时, 直接使用ctrl-h/j/k/l
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>h <C-W>h
map <Leader>l <C-W>l
" 快速水平竖直分屏
map <Leader>\ <C-W>v
map <Leader>- <C-W>s

" F2 行号开关，用于鼠标复制代码用
nnoremap <F2> :set nu! nu?<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" 开启粘贴模式的话, 不会自动缩进
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
au InsertLeave * set nopaste
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" kj 替换 Esc, 插入模式下
inoremap kj <Esc>

" Quickly close the current window, 快速关闭当前window
nnoremap <leader>q :q<CR>
" Quickly save the current file,  快速保存当前window
nnoremap <leader>w :w<CR>

" select all, 选中所有
map <Leader>sa ggVG"

" remap U to <C-r> for easier redo, 大写U来撤销normal状态下的操作
nnoremap U <C-r>

" 搜索时, 进入下一个上一个始终放在屏幕中间, 参考http://www.wklken.me/posts/2016/02/03/some-vim-configs.html
"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" 关闭掉上次搜索的高亮
noremap <silent><leader>/ :nohls<CR>
"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" 复制动作的变更, Y, 复制到行末
" y$ -> Y Make Y behave like other capitals
map Y y$

"Map ; to : and save a million keystrokes
" ex mode commands made easy 用于快速进入命令行
nnoremap ; :

" Shift+H goto head of the line, Shift+L goto end of the line
" H 快速到行首, L快速到行尾
nnoremap H ^
nnoremap L $

" save, 没权限时保存
cmap w!! w !sudo tee >/dev/null %

" command mode, ctrl-a to head， ctrl-e to tail
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
