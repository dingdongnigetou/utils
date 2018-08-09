" dingdongnigetou 

" 1. first to do 
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2. if not found python in vim, then apt-get remove vim && apt-get install vim-gnome-py2
" 3. install YouCompleteMe when you BundleInstall all.
"    确保已经安装了python-dev,cmake,clang
"    cd ~/.vim/bundle/YouCompleteMe
"    ./install --clang-completer --system-libclang
" 若打开vim时出现can not import name ReadTimeOut：
"    a. pip install requests
"    b. pip install --upgrade requests
" 4. install pyclewn
"   a. sudo pip install pyclewn
"   b. python -c "import clewn; clewn.get_vimball()"
"   c. vim -S pyclewn-2.3.vmb
" 5. install ack
"   apt install ack-grep

"set spell
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" 可以通过以下四种方式指定插件的来源  
" a)
" 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。  
Bundle 'L9'  

" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定  
Bundle 'tpope/vim-fugitive'  
Bundle 'Lokaltog/vim-easymotion'  
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}  
Bundle 'tpope/vim-rails.git'  
Bundle 'winmanager'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'tagList.vim'
Bundle 'sjas/csExplorer'
Bundle 'vim-scripts/EasyGrep'
Bundle 'ianva/vim-youdao-translater'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'kshenoy/vim-signature'
Bundle 'dyng/ctrlsf.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'derekwyatt/vim-protodef'
Bundle 'fatih/vim-go'

" c) 指定非Github的Git仓库的插件，需要使用git地址  
" Bundle 'git://git.wincent.com/command-t.git'  

" d) 指定本地Git仓库中的插件  
" Bundle 'file:///Users/gmarik/path/to/plugin'  

filetype plugin indent on     " required! 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'""

"Set mapleader
let mapleader = ","
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 
map <c-up> :resize +1<cr>
map <c-down> :resize -1<cr>
map <c-left> :vertical resize -1<cr>                                                                                                                                     
map <c-right> :vertical resize +1<cr>

" Others
set nu
set path+=.
set path+=/usr/include
set noexpandtab tabstop=4 shiftwidth=4 ts=4
set hlsearch
set cursorline
set cursorcolumn
set nowrap
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" vim-powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

" color
set background=dark
set t_Co=256
colorscheme molokai
"colorscheme solarized

" WinManager 
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 20 
let g:defaultExplorer = 0
map <C-W><C-F> :FirstExplorerWindow<cr>
map <C-W><C-B> :BottomExplorerWindow<cr>
map <silent><leader>wm :WMToggle<cr> 

" TagList
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
map <silent><F9> :TlistToggle<cr>

" Buffer
map <silent><leader>bn :bn<cr>
map <silent><leader>bp :bp<cr>
map <silent><leader>bf :bf<cr>
map <silent><leader>bl :bl<cr>

" LookUpFile
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")               "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
map <silent><leader>lk :LUTags<cr>
map <silent><leader>ll :LUBufs<cr>
map <silent><leader>lw :LUWalk<cr>

" youdao
vmap <silent> <C-T> <Esc>:Ydv<CR> 
nmap <silent> <C-T> <Esc>:Ydc<CR> 
map  <leader>yd :Yde<CR>

"YouCompeleteme
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0 " 禁止启动时询问是否加载配置文件
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tags_files=1  "开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2      "从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                       "禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1         "语法关键字补全
let g:ycm_complete_in_comments = 0 "在注释输入中也能补全
let g:ycm_complete_in_strings = 0 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
"映射OmniCppComplete
inoremap <leader>,  <C-x><C-o> 

"pyclewn
let pyclewn_args="--window=bottom"

"vim-fswitch
" *.cpp 和 *.h 间切换, 在fswitch.vim中可配置对应关系
 nmap <silent> <Leader>sw :FSHere<cr>

"vim-signature
let g:SignatureMap = {
         \ 'Leader'             :  "m",
         \ 'PlaceNextMark'      :  "m,",
         \ 'ToggleMarkAtLine'   :  "m.",
         \ 'PurgeMarksAtLine'   :  "m-",
         \ 'DeleteMark'         :  "dm",
         \ 'PurgeMarks'         :  "mda",
         \ 'PurgeMarkers'       :  "m<BS>",
         \ 'GotoNextLineAlpha'  :  "']",
         \ 'GotoPrevLineAlpha'  :  "'[",
         \ 'GotoNextSpotAlpha'  :  "`]",
         \ 'GotoPrevSpotAlpha'  :  "`[",
         \ 'GotoNextLineByPos'  :  "]'",
         \ 'GotoPrevLineByPos'  :  "['",
         \ 'GotoNextSpotByPos'  :  "mn",
         \ 'GotoPrevSpotByPos'  :  "mp",
         \ 'GotoNextMarker'     :  "[+",
         \ 'GotoPrevMarker'     :  "[-",
         \ 'GotoNextMarkerAny'  :  "]=",
         \ 'GotoPrevMarkerAny'  :  "[=",
         \ 'ListLocalMarks'     :  "ms",
         \ 'ListLocalMarkers'   :  "m?"
         \ }

"ctrlsf.vim 查找关键字
"后台调用的是ack（v2.0以上）
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
" q是退出 p是详细信息
nnoremap <Leader>sp :CtrlSF<CR>

"terryma/vim-multiple-cursors
"配合ctrlst使用 可视化模式下选中一个, ctrl-n选中下一个，即可同步修改

" 替换函数。参数说明：
" " confirm：是否替换前逐一确认
" " wholeword：是否整词匹配
" " replace：被替换字符串
function! Replace(confirm, wholeword, replace)
	wa
	let flag = ''
	if a:confirm
		let flag .= 'gec'
	else
		let flag .= 'ge'
	endif
	let search = ''
	if a:wholeword
		let search .= '\<' . escape(expand('<cword>'),'/\.*$^~[') . '\>'
	else
		let search .= expand('<cword>')
	endif
	let replace = escape(a:replace,'/\&~')
	execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
"不确认、非整词
nnoremap<Leader>R :call Replace(0,0,input('Replace '.expand('<cword>').' with:'))<CR>
"不确认、整词
nnoremap<Leader>rw :call Replace(0,1,input('Replace '.expand('<cword>').' with:'))<CR>
"确认、非整词
nnoremap<Leader>rc :call Replace(1,0,input('Replace '.expand('<cword>').' with:'))<CR>
"确认、整词
nnoremap<Leader>rcw :call Replace(1,1,input('Replace '.expand('<cword>').' with:'))<CR>
nnoremap<Leader>rwc :call Replace(1,1,input('Replace '.expand('<cword>').' with:'))<CR>

"vim-protodef
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

