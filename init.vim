"-----------------------------------------vim-plug插件官方设置-------------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'



Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'        "快速跳转
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
Plug 'skammer/vim-css-color'
Plug 'alvan/vim-closetag'             "自动关闭标签
Plug 'hail2u/vim-css3-syntax'      "css3 语法高亮
Plug 'plasticboy/vim-markdown'                "markdown 语法高亮
Plug 'mxw/vim-jsx'                    "React JSX 语法高亮
Plug 'chiel92/vim-autoformat'         "格式化
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'maksimr/vim-jsbeautify'
Plug 'tacahiroy/ctrlp-funky'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neopairs.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} "代码补全
"Plug 'valloric/youcompleteme'
"Plug 'winmanager'


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Initialize plugin system
call plug#end()






 "--------------------------------------------基本设置--------------------------------------------
 set number              "显示行号
 set relativenumber      "相对行号
 set cursorline          "当前行高亮
 set ruler               "打开状态栏标尺
 set hlsearch            "搜索时高亮显示找到的文本
 set incsearch           "输入搜索内容时就显示结果
 syntax on               "语法高亮
 set autoindent          "自动缩进
 set showmatch           "光标遇到括号自动高亮另一括号
 "set spell spelllang=en_us "打开英文单词的拼写检查
 set history=1000        "记住多少次历史操作
 set ignorecase
 set t_Co=256            "设置配色时需要，也可只设置它
 "配色推荐potato darkblue horizon molokai night-owl inkpot
:colorscheme atom-dark-256
 filetype plugin on      "根据侦测到的不同类型加载对应插件
 let mapleader=","       "快捷键前缀

 " 使用 leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
noremap <leader>q :q<cr> "不保存退出
noremap <leader>wq :wq<cr> "保存并退出


"括号输入自动补全
inoremap ( 	()<ESC>i
inoremap < 	<><ESC>i
inoremap [ 	[]<ESC>i
inoremap { 	{}<ESC>i
inoremap ( 	()<ESC>i
inoremap ( 	()<ESC>i


inoremap ' 	''<ESC>i
inoremap " 	""<ESC>i
inoremap ` 	``<ESC>i

"---------------------------------------------------NERDTree配置--------------

 map <C-n> :NERDTreeToggle<CR>           "显示/隐藏 Tree的快捷键 ctrl + n

 map <leader>ff :NERDTreeFind<CR>        "查找文件在目录的位置
 nnoremap <C-l> gt       "替换快捷键 切换tab
"autocmd VimEnter * NERDTree



let NERDTreeMinimalUI=1  "去除第一行的帮助提示
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * if !argc()|NERDTree|endif   "打开vim时如果没有文件自动打开NERDTree
autocmd VimEnter * wincmd l "打开vim 时光标不在nerdtree中
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1


let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules','.DS_Store'] "ignore files in NERDTree "不显示文件
let NERDTreeShowFiles=1
map tt <C-w>w   "映射 tt 为 ctrl+ww 切换窗口










"-----------------------------------------CtrlP 配置
let g:ctrlp_map = '<leader>p'           ",p 调用ctrlp
let g:ctrlp_cmd = 'CtrlP'
"工作目录随文件变  即在当前目录下搜索
autocmd BufEnter * cd %:p:h
"map <leader>f :CtrlPMRU<CR>             ",f 在查找缓存当中搜索文件,搜索过的文件会在这里，方便二次查找
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
"let g:ctrlp_working_path_mode=0

let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


nnoremap <Leader>fu :CtrlPFunky<Cr>     " ,fu 调用开始搜索方法



"-----------------------------------------vim-jsx 配置
let g:jsx_ext_required =0       "扩展名为.js,.jsx 启用语法突出显示与缩进

let g:tagbar_width=35


"-------------------------------------vim-javascript配置    =G 格式化代码
set omnifunc=javascriptcomplete
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let javascript_enable_domhtmlcss = 1
"set foldmethod=syntax
"set conceallevel=1





"-------------------------------------vim-jsbeautify配置
map <c-a> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-a> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-a> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-a> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-a> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-a> :call CSSBeautify()<cr>

nmap <silent> <c-m> :TagbarToggle<CR>        "按ctrl+m即可打开tagbar界面







"--------------------------------------创建/修改文件时自动加入头部注释

function! CommentInfo()
call setline(1,"")
call append(2,"# Author:        张鹏")
call append(3,"# Create Date:   "  . strftime("%Y-%m-%d %H:%M:%S"))
call append(4,"# Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
call append(5,"# Description:   ")
endfunction

function! DateInsert()
"call cursor(7,1)
if search('Last modified') != 0
	let line = line('.')
	if &filetype == 'less' || &filetype == 'sass'
		call setline(line,"// Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
	else
		call setline(line,"# Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
	endif
endif
endfunction


function! SetComment()
	if &filetype == 'html'
		call append(1,'<!--')
		call CommentInfo()
		call append(6,'-->')
	elseif &filetype == 'less' || &filetype == 'sass'
		call append(1,"// Author:        张鹏")
		call append(2,"// Create Date:   " . strftime("%Y-%m-%d %H:%M:%S"))
		call append(3,"// Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
		call append(4,"// Description:   ")
	else
		call append(1,'/**')
		call CommentInfo()
		call append(6,'**/')
	endif
endfunction

autocmd BufNewFile *.html,*.js,*.css,*.less,*.sass call SetComment()

autocmd BufWritePre *.html,*.js,*.css,*.less,*.sass ks|call DateInsert()|'s
