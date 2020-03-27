"美化 {{{

set termguicolors ""启用真彩配置
if has('gui_running')
    colorscheme gruvbox
    set background=dark
endif

"}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree {{{

let NERDTreeQuitOnOpen=1   "文件打开时关闭NERDTree
let NERDTreeAutoDeleteBuffer = 1 "删除文件
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}" "显示文件当前路径

let NERDTreeWinSize=25                "设置NERDTree窗口宽度
let NERDTreeShowBookmarks=1           "显示书签
let NERDTreeChDirMode=2               "自动将Vim的pwd设为当前打开的目录.
let NERDTreeShowFiles=1               "显示文件
let NERDTreeShowHidden=0              "不显示隐藏文件
let NERDTreeShowLineNumbers=1         "显示行号
let NERDTreeAutoCenter=1              "控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeMouseMode=2               "指定鼠标模式(1.双击打开 2.单击打开目录双击打开文件 3.单击打开)
let NERDTreeMinimalUI = 1 "关闭帮助提示
let NERDTreeDirArrowExpandable = '+' "修改树的显示图标
let NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore=['\.$','\~$', '\.pyc$', '\.swp$', '^__pycache__$']   "要忽略文件

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-nerdtree-syntax-highlight {{{

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeExtensionHighlightColor = {
  \ 'yaml': '1AB2AC',
  \ 'yml': '1AB2AC',
  \ 'vim': '61A275',
  \ 'js': 'F0DF64',
  \ 'jsx': 'F0DF64',
  \ 'json': 'CBB26F',
  \ 'ts': '2F7488',
  \ 'sh': '8CDE5A',
  \ 'bash': '8CDE5A',
  \ 'md': '7D876D',
  \ 'markd': '7D876D',
  \ 'markdown': '7D876D',
  \ 'log': '619D00',
  \ 'go': '1CADD5',
  \ 'svg': 'A8F927',
  \ 'toml': '955220',
  \ 'py': '3873A3',
  \ 'htm': 'E14D30',
  \ 'html': 'E14D30',
  \ 'rs': 'DDA586',
  \ 'rb': '6F1619',
  \ 'ex': '6D4B7D',
  \ 'exs': '6D4B7D',
  \ 'j2': 'B21A1F',
  \ 'pdf': 'FC2122',
\}

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree-git-plugin {{{

let g:NERDTreeExactMatchHighlightColor = {
  \ 'Dockerfile': '3EA0EB',
  \ 'Makefile': '447721',
  \ '.git': 'B19D54',
  \ '.gitignore': '877840',
\}

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

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-surround {{{
"- ds 删除一个配对符号
"- cs 修改一个配对符号
"- ys 增加一个配对符号
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-easy-align {{{
xnoremap <silent> ga <Plug>(EasyAlign)
nnoremap <silent> ga <Plug>(EasyAlign)

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Graphviz {{{

"默认使用dot将文件编译为pdf文件
":Graphviz 打开编译后的文件，默认打开pdf文件。可选项: 'ps', 'pdf', 'png', 'jpg', 'gif', 'svg'
":GraphvizCompile [exe] [format]，exe代表编译程序，默认为dot，format为编译后文件的格式
":GraphvizCompile 默认使用dot将文件为pdf文件

" 指定打开文件的命令。默认会根据平台自动选择
" macOS 使用 open, Linux 使用 xdg-open 等
let g:graphviz_viewer = 'open'

" 默认编译生成 pdf 格式，如果想要其他格式，将 pdf 换成其他格式即可
let g:graphviz_output_format = 'pdf'
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"LeaderF{{{

let g:Lf_HideHelp = 1 " don't show the help in normal mode
let g:Lf_UseCache = 0 " Do not use cache file
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
    \ 'dir': ['.git', '__pycache__', '.DS_Store'],
    \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
    \ '*.gif', '*.db', '*.tgz', '*.tar.gz', '*.zip', '*.bin', '*.pptx',
    \ '*.xlsx', '*.docx', '*.pdf', '*.tmp', '*.wmv', '*.mkv', '*.mp4',
    \ '*.rmvb']
    \}

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"indentLine {{{
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊', '▏']

if has('gui_running')
    let g:indentLine_color_gui = '#A4E57E'
else
    let g:indentLine_color_term = 239
endif

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"rainbow {{{
let g:rainbow_active = 1 "启用rainbow

"}}}
"==============================================================================
"==============================================================================
"ALE {{{
"⛔🅾⚠✖❌❗❓❎📑🔏🔐🆎

let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'  "自定义error和warning图标
let g:ale_sign_warning = '⛔'

"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '❌'
let g:ale_echo_msg_warning_str = '⛔'
let g:ale_echo_msg_format = '[%linter%][%severity% : %code%] %s'


let g:ale_linters_explicit = 1               ""使用指定的Linter
let g:ale_linters = {'python': ['flake8'], 'vim': ['vint']}
let g:ale_python_flake8_options="--ignore=E114,E116,E131 --max-line-length=120"
let g:ale_fixers = {'python': ['isort','yapf','autopep8', 'remove_trailing_lines', 'trim_whitespace']}

""关闭本地列表,使用 quickfix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nercommenter {{{

let g:NERDCompactSexyComs = 1 "美化多行注释
let g:NERDSpaceDelims=1 "注释符号后面自动加个空格

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim-repl {{{

let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'vim': 'vim -e',
            \   }
let g:repl_predefine_python = {
            \   'pandas': 'import pandas as pd',
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3     "0表示出现在下方，1表示出现在上方，2在左边，3在右边

let g:sendtorepl_invoke_key = "<leader>w"   "传送代码快捷键，默认为<leader>w
let g:repl_stayatrepl_when_open = 0         "打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AsyncRun {{{

let g:asyncrun_open = 6 ""自动打开 quickfix window ，高度为 6
let g:asyncrun_bell = 1 ""任务结束时候响铃提醒
let $PYTHONUNBUFFERED=1 ""看到 Python 实时输出

if has('win64')
  let asyncrun_encs = 'gbk'
endif

"}}}
