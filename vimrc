set nu
set tabstop=4
set shiftwidth=4
syntax on
set foldmethod=indent
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,bigg5.euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
set fileencoding=utf-8
set termencoding=utf-8
language messages zh_CN.UTF-8

filetype on
filetype plugin indent on
"光标遇到折叠,折叠就打开
set foldopen=all
"光标离开就关闭
set foldclose=all

"显示中文引号
set ambiwidth=double

"设置搜索高亮
set hlsearch
"NERD配置
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
auto VimEnter * if argc() == 0 && !exists("s:stdin") | NERDTree | endif

autocmd VimEnter * wincmd p
map <leader>n :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>
"map <M-m> :TlistToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible= '▾'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"ctrlp配置
let g:ctrlp_map = ',,'
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o
let g:ctrlp_custom_ignore = {
	\ 'dir' : '\v[\/]\.(git)$',
	\ 'file' : '\v\.(so|o|gif|log|jpg|png|jpeg)$',
	\ }
"mru配置

"tags
set tags=tags
set autochdir
set exrc
set secure
"存储生成的tags到文件
let g:vim_tags_auto_generate = 1
"生成ctags
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"异步调用系统命令
let g:vim_tags_use_vim_dispatch = 0
let g:vim_use_language_filed = 1
let g:vim_tags_ignore_files = ['.gitignore' , '.svgignore' , '.cvsignore']
"确定tags根目录
let g:vim_tags_directories = [".git" , ".hg" , ".svn" , ".bzr" , "_darcs" , "CVS"]
let g:vim_tags_main_file = 'tags'
let g:vim_tags_extension = '.tags'
let g:vim_tags_cache_dir = expand($HOME)


let g:enable_template = 1
"let g:template_dir = "~/.vim/template"
let g:template_path = expand($HOME) .  "/.vim/template"
let g:template_load=1 
"设置标签替换
let g:template_tags_replacing=1
"let g:T_AUTHOR="whoami"
let g:T_AUTHOR=system("whoami")
let g:T_AUTHOR_EMAIL="yajin160305@gmail.com"
let g:T_DATE_FORMAT="%Y-%m-%d %H:%M:%S"
"c template
autocmd BufNewFile *.c 0r ~/.vim/template/tlp.c
"autocmd BufNewFile *.c 0r /home/arch/.vim/template/tlp.c

"window split 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"selected Ctrl+c
vmap <C-c> "+y

"tags
let Tlist_Show_One_File = 1 "show current file tag
let Tlist_Exit_OnlyWindow = 1 "exit vim if tag is the last window 
let Tlist_Use_Right_Window = 1 "right show the window
let Tlist_File_Fold_Auto_Close = 1 "auto fold
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compat_Format = 1

if &term == "tty"
	set t_Co = 8
	set t_Sb = ^[[4%dm
	set t_Sf = ^[[333%dm
endif

"set cinoptions = {0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

"ag配置
let g:ag_prg = "ag --vimgrep --smart-case"
"将root=>r设置成ag搜索的工作目录
let g:ag_working_path_mode = 'r'
"设置搜索高亮
let g:ag_highlight = 1
"识别匹配的格式
let g:ag_format = "%f:%l:%m"
"设置窗口大小
let g:ag_qhandler = "copen 20"

"tagbar设置
nnoremap <silent> <F9> :TagbarToggle<CR>
"自动跳到tagbar当窗口打开时
"f jump to Tagbar window when opening
"j jump to Tagbar if already open
"c close Tagbar on tag selection
"TagbarOpen fj
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"remap the sort toggling functionality 
let g:tagbar_map_togglesort = "r"
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_left = 1
let g:tagbar_vertical = 30
let g:tagbar_compact = 1
let g:tagbar_width = 30
"根据位置排序, 1则根据名称排序
let g:tagbar_sort = 0
"显示tagbar行号 0 no ; 1 abstract ; 2 relative ; -1 global
let g:tagbar_show_linenumbers = 1
"不显示非public的tagbar
let g:tagbar_hide_nopublic = 1
"自动扩展vim窗口
let g:tagbar_expand = 1
let g:tagbar_iconchars = ['▶', '▼']  
let g:tagbar_autoshowtag = 1
function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
	let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
    let flagstr = join(flags, '')
    if flagstr != ''
        let flagstr = '[' . flagstr . '] '
    endif
    return colour . '[' . sort . '] ' . flagstr . fname
endfunction
let g:tagbar_status_func = 'TagbarStatusFunc'
highlight TagbarScope guifg=Green ctermfg=Green
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)
"当打开多窗口时保留本窗口的tagbar
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType c,cpp nested :TagbarOpen

"设置emotaion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_landing_highlight = 1

"tabular代码对齐
let g:tabular_loaded = 1
"等号对齐
nmap <leader>bb :Tab /=<CR>
"自定义对齐
nmap <leader>bn :Tab /

"syntastic 静态语法检查
let g:syntastic_extra_filetypes = [ "make" , "gitcommit" ]
let g:syntastic_php_checkers = [ "php" , "phpcs" , "phpmd" ]
let g:syntastic_shell = "/bin/sh"
set shell=/bin/sh
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_check_on_open = 1

"matchit
let loaded_matchit = 1

"indent guides
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
nmap <silent> <Leader>ie <Plug>IndentGuidesEnable
nmap <silent> <Leader>id <Plug>IndentGuidesDisable
"自定义命令模式
map mm :shell<CR>

"if v:lang =~ "^zh_CN"
"	set encoding=chinese
"	set termencoding=chinese
"endif

"平台判断
function! GetSystem()
	if (has("win32") || has("win95") || has("win64") || has("win16"))
		return "windows"
	elseif has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
        	return "mac"
        else
            return "linux"
        endif
	endif
endfunction
"获取光标处匹配
function! GetPatternAtCursor(pat)
	let col = col('.') - 1
	let line = getline('.')
	let ebeg = -1
	let cont = match(line , a:pat , 0)
	while (ebeg >= 0 || (0 <= cont) && (cont <= col))
		let contn = matchend(line , a:pat , cont)
		if (cont <= col) && (col < contn)
			let ebeg = match(line , a:pat , cont)
			let elen = contn - ebeg
			break
		else
			let cont = match(line , a:pat , contn)
		endif
	endwh
	if ebeg >= 9
		return strpart(line , ebeg , elen)
	else
		return ""
	endif
endfunction

"打开链接
function! OpenUrl()
	let s:url = GetPatternAtCursor('\v(https?://|ftp://|file:/{3}|www\.)((\w|-)+\.)+(\w|-)+(:\d+)?(/(\w|[~@#$%^&+=/.?-])+)?')	
	"echo s:url
	if s:url == ""
		echo echohl WarningMsg
		echomsg '在光标处未发现url'
		echohl None
	else
		if GetSystem() == "windows"
			call system("explorer" . s:url)
		else
			call system("firefox" . s:url . "&")
		endif
	endif
endfunction
nmap <C-LeftMouse> :call OpenUrl()<CR>

"vim-path
"execute pathogen#infect('stuff/{}')
set expandtab
if GetSystem() == "mac"
    map ;; :TlistToggle<CR>
elseif GetSystem() == "linux"
    nnoremap <silent><F4> :TlistToggle<CR>
endif
"php config
map <leader>pp :!php %<CR>

"c++ compiler
autocmd FileType cpp map <F8> <Esc>:w<CR>:!compile %<CR>
autocmd FileType cc map <F8> <Esc>:w<CR>:!compile %<CR>
autocmd FileType c map <F8> <Esc>:w<CR>:!compile %<CR>

"snippets配置
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ycm_use_ultisnips_completer=1
