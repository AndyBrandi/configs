cd ~/Desktop/webserver/
set autochdir
set nobackup
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set nocompatible
filetype off 

Plugin 'https://github.com/Lokaltog/vim-easymotion'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/gmarik/Vundle.vim'
" Plugin 'https://github.com/junegunn/goyo.vim'
Plugin 'tomtom/tcomment_vim'
"Plugin 'https://github.com/ervandew/supertab'
"Plugin 'AutoComplPop'
" Plugin 'surround.vim'
Plugin 'Rename'
"Plugin 'php.vim'
Plugin 'tagbar'
Plugin 'https://github.com/gcmt/taboo.vim'
Plugin 'fugitive.vim'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/Yggdroot/indentLine'
Plugin 'https://github.com/sheerun/vim-polyglot'
" Plugin 'https://github.com/tpope/vim-ragtag'
" Bundle 'joonty/vdebug.git' 

call vundle#end()
filetype indent on
filetype plugin on



 
"KBD SHORTCUTS
"-------------------------------------------------------------------------------------------
"nnoremap <C-[> :CtrlPMRUFiles<CR>
map <Tab> <Plug>(easymotion-prefix)
map <C-n> :NERDTreeToggle<CR>

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprevious<CR>
nnoremap <C-X> :bp <BAR> bd #<CR>

nnoremap ; :

imap jk <esc>
nnoremap <space> <NOP>

noremap - "_dd

nnoremap <Leader>q :TagbarToggle<CR><C-w>=
nnoremap <Leader>s :silent !iterm &<CR>
nnoremap <Leader>[ :ed $MYVIMRC<CR>
nnoremap <Leader>p :source %:p<CR>
nnoremap <Leader><space> :Goyo<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap {}  {}<Esc>i<CR>.<CR><Esc>=k<S-a><Backspace>
inoremap {}  {}<Esc>i<CR><Esc>=ko

nnoremap <Leader>b :call ToggleBackground()<CR>

function! ToggleBackground()
  let background = &background
  if background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

" switching windows
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" switching tabs
let i = 1
while i <= 9
    execute 'nnoremap <Leader><Leader>' . i . ' :' . i . 'tabn<CR>'
    let i = i + 1
endwhile

nnoremap <Leader>t :call CreateTab()<CR>


function! CreateTab()
  call inputsave()
  let tabname = input('New tab name: ')
  call inputrestore()
  execute 'TabooOpen ' . tabname

endfunction

"
"
" DEFAULT COMMANDS
" =============================================================================

"====

syntax on
set hidden


set number
set t_Co=256
"set guifont=Monospace\ 9 
"set guifont=Inconsolata\ 12
" set guifont=M+\ 1mn\ 13
set guifont=Monaco:h13
set lsp=2
" solarized options 
"let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

colorscheme solarized 
set background=dark
"set list

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smartcase
set showmatch
set nocursorline
set colorcolumn=90
"let php_folding=1
set foldenable
set foldlevelstart=10

hi ColorColumn guibg=#542a2a
hi CursorLine guibg=#04474f
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%91v.\+/


command Php !php -l %



hi EndOfBuffer guifg=bg



"-------------------------------------------------------------------------------------------
"PLUGIN SETTINGS
"-------------------------------------------------------------------------------------------

let g:ctrlp_mruf_relative = 1
"let g:ctrlp_cmd = "CtrlPBuffer"
let g:ctrlp_working_path_mode = 'r'

let g:acp_enableAtStartup = 1

if !exists("g:vdebug_options")
  let g:vdebug_options = {}
endif
let g:vdebug_options["server"] = "10.0.2.2"
let g:vdebug_options["path_maps"] = {"/srv/http" : "/Users/andybrandscher/Desktop/webserver"}

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set fillchars+=vert:\ 

let g:ctrlp_switch_buffer = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 100

set laststatus=2
set noshowmode
" let g:airline_powerline_fonts = 1
set hlsearch
nmap <silent> <Esc> :nohlsearch<CR>

let g:goyo_width = 120
let g:goyo_height = '200%'
let g:goyo_linenr = 1

let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 1


let taboo_tab_format = " %N %f "
let taboo_renamed_tab_format = " %N %l "
