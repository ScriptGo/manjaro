"Vim插件

if has('win64')
   let g:plugged_home = $VIMCONFIG.'/plugged'
else
   let g:plugged_home = $HOME.'/.vim/plugged'
endif
call plug#begin(g:plugged_home)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"启动页
Plug 'mhinz/vim-startify'

"主题
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'

"美化
Plug 'ryanoasis/vim-devicons'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""资源管理
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"实用插件
Plug 'tpope/vim-surround' "快速编辑成对的符号
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }  "对齐
Plug 'liuchengxu/graphviz.vim' "流程图
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } "快捷键管理
Plug 'lilydjwg/colorizer' "预览颜色

if has('win64')
    Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
Plug 'Yggdroot/indentLine', { 'for': ['python', 'vim', 'sh']}  "缩进线
Plug 'luochen1990/rainbow'        "彩虹括号
Plug 'jiangmiao/auto-pairs'       "括号补全

"Python
Plug 'dense-analysis/ale'         ""语法检查
Plug 'preservim/nerdcommenter'    ""注释
Plug 'sillybun/vim-repl'          ""REPL
Plug 'skywind3000/asyncrun.vim', {'for': ['python']}   ""异步运行

call plug#end()
filetype plugin indent on     "必须有
