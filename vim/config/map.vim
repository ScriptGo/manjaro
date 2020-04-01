"""TimeOut

set timeout ttimeout    "打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set timeoutlen=600      "Time out on mappings
set updatetime=500      "Idle time to write swap and trigger CursorHold
set ttimeoutlen=60      "功能键超时检测 50 毫秒
set winaltkeys=no       "alt键不映射到菜单栏

"""配置leader键
"""主leader绑定为 <Space>
"""副leader绑定为 ,
let g:mapleader="\<Space>"
let g:maplocalleader=','
"""将 : 映射为 ;

nnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""功能键配置

"""F1 废弃这个键，防止调出系统帮助
noremap <F1> <ESC>

"""F2 普通模式下相对行号和绝对行号的切换
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <silent> <F2> :call NumberToggle()<CR>

"""F3 隐藏/显示缩进线
nnoremap <silent> <F3> :IndentLinesToggle<CR>:set list! lcs=tab:\\|\<Space><CR>

"""F4 如果Nerdtree已经存在，就切换显示与隐藏
noremap <silent> <F4>  :NERDTreeToggle<CR>
inoremap <silent> <F4> :NERDTreeToggle<CR>

"""F5 AsyncRun 运行Python
nnoremap <silent> <F5>  :AsyncRun -raw python %<CR> ""运行

"""F6 打开QuickFix
nnoremap <silent> <F6> :call asyncrun#quickfix_toggle(6)<CR>

"""F7
"""F8  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" 快速保存与退出

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

inoremap <C-s> <C-o>:w<CR>
inoremap <C-q> <ESC>:wq<CR>

" Use sane regex expression (see `:h magic` for more info)
nnoremap / /\v

"插入模式下输入当前日期和时间的快捷键
inoremap nwt <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap ddt <C-R>=strftime("%Y-%m-%d")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""插入模式

""移动到行首/行尾
inoremap <C-a> <Home>
inoremap <C-e> <End>

""向左/右移动一个字符
inoremap <C-b> <Left>
inoremap <C-f> <Right>

""向上/下直线移动一个字符(行)

inoremap <C-k> <c-o>gk
inoremap <C-j> <c-o>gj

""向左/右移动一个word
inoremap <A-b> <C-o>b
inoremap <A-f> <C-o>w

""向左/右删除一个字符(BS/Del)
""向左/右删除一个word
inoremap <A-h> <C-o>db
inoremap <A-l> <C-o>dw

""删除当前行
inoremap <C-d> <C-o>dd

""在当前行的下方/上方插入新行

if has('gui_running')
     inoremap <C-enter> <C-o>o
     inoremap <C-Down> <C-o>O
   else
     inoremap <s-enter> <C-o>o
     inoremap <s-Down> <C-o>O
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""命令行模式

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""窗口操作

"""切换

nnoremap <A-H> <c-w>h
nnoremap <A-L> <c-w>l
nnoremap <A-J> <c-w>j
nnoremap <A-K> <c-w>k

inoremap <A-H> <ESC><c-w>h
inoremap <A-L> <ESC><c-w>l
inoremap <A-J> <ESC><c-w>j
inoremap <A-K> <ESC><c-w>k

"终端下切换窗口
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""Tab

nnoremap <silent> <C-t> :tabnew<CR>
inoremap <silent> <C-t> <C-o>:tabnew<CR>

nnoremap <silent> <leader> tw :tabnew<CR>
nnoremap <silent> <leader> tc :tabclose<CR>
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/
nnoremap <leader>tm :tabmove<CR>

"""切换Tab

noremap <silent> <leader>tn :tabnext<CR>
noremap <silent> <leader>tp :tabprev<CR>


noremap <silent><m-1> :tabn 1<CR>
noremap <silent><m-2> :tabn 2<CR>
noremap <silent><m-3> :tabn 3<CR>

inoremap <silent><m-1> <ESC>:tabn 1<CR>
inoremap <silent><m-2> <ESC>:tabn 2<CR>
inoremap <silent><m-3> <ESC>:tabn 3<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""Buffer

nnoremap <silent> <S-Right>  :bnext<CR>
nnoremap <silent> <S-Left>   :bprevious<CR>

"""关闭
nnoremap <C-x>  :bd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""插件按键配置


"设置切换Buffer快捷键"
 nnoremap <C-tab> :bn<CR>
 nnoremap <C-s-tab> :bp<CR>

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
