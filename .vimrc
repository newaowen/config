set nocompatible
filetype off 

" set runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 

Plugin 'gmarik/Vundle.vim'
" other plugins
Plugin 'kien/ctrlp.vim'
"Plugin 'L9'
" Plugin 'Lokaltog/vim-powerline' " , {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'

" minibufexploer
" Plugin 'fholgado/minibufexpl.vim'

" nerdtree
" Plugin 'scrooloose/nerdtree'
" nerdtree and tabs
" Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'wincent/command-t'
call vundle#end()

filetype on
filetype indent on 
filetype plugin indent on
" filetype plugin on

" non-plugin stuff go here
syntax on " 五颜六色就靠它了
set number
" set cursorline " hightlinght cursor line
set ruler

" tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

set encoding=utf-8
"set autochdir " 自动切换当前目录为当前文件所在的目录 影响cscope/ctags,取消
set backupcopy=yes " 设置备份时的行为为覆盖
set noswapfile
set nobackup
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch
set incsearch " 增量查找，输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set ignorecase
set smartcase
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set backspace=indent,eol,start

" leader配置 \<Space>
let mapleader =  ","

"buffer管理(不太实用)
"需要的是能 在多个buffer中输入关键词，快速切换的插件
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
"使用CtrlPBuffer切换(实际效果有点慢啊)
nnoremap <C-S-B> :CtrlPBuffer<CR>

" @deprecated powerline 
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" airline配置(有这个后，基本不需要miniBufExplorer)
" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ctags配置 (注意';', 表示一直递归到父目录)
set tags=tags,./vim.tags;~/

" cscope配置
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    endif

    " keymap配置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
    " C-@ 是Ctrl+Space, 但一般会和输入法切换冲突
    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    " nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    " nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    " nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    " nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    " nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    " nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    " nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>    
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

" NerdTree配置-如果没有指定文件，则自动打开 
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NerdTree配置-快捷键toggle
" ap <C-n> :NERDTreeToggle<CR>
" NerdTree配置-自动关闭nerdtree窗口
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
"    b:NERDTreeType == 'primary') | q | endif
