set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if filereadable(expand("~/.vimrc"))
	source ~/.vimrc
endif


set linebreak
set nowrap
set ruler
set number
set showmatch
syntax on
set mouse=a
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set relativenumber
set splitbelow
set splitright
set wildignorecase
command! W :w
command! WQ :wq
command! Wq :wq
set scrolloff=3

let g:user42 = 'mafioron'
let g:mail42 = 'mafioron@student.42.fr'


let mapleader=" "

nnoremap <leader>T :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=floaterm<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>b :Telescope buffers<cr>
nnoremap <leader>f :Telescope find_files<cr>
nnoremap <leader>t :Telescope<cr>
nnoremap <leader>o gT
nnoremap <leader>p gt


""""""""""""""""""""""""""""""""""""""""""""""
"				My remaps
""""""""""""""""""""""""""""""""""""""""""""""

tnoremap <C-q> <C-\><C-n>
nnoremap <C-t> <C-w>j<C-w>j
tnoremap <C-t> <C-\><C-n><C-w>j<C-\><C-n><C-w>j
"nnoremap <C-m> <C-w>k
"tnoremap <C-m> <C-\><C-n><C-w>k
nnoremap bt :bot term<CR>
nnoremap <leader>g <cmd>Telescope grep_string<cr>
nnoremap <leader>G <cmd>Telescope live_grep<cr>

" Navigate splits with Ctrl + Arrow keys
nnoremap <silent> <C-Left>  <C-w>h
nnoremap <silent> <C-Down>  <C-w>j
nnoremap <silent> <C-Up>    <C-w>k
nnoremap <silent> <C-Right> <C-w>l

" Resize splits with Shift + Arrow
nnoremap <silent> <C-S-Left>  :vertical resize -5<CR>
nnoremap <silent> <C-s-Down>  :resize +5<CR>
nnoremap <silent> <C-s-Up>    :resize -5<CR>
nnoremap <silent> <C-s-Right> :vertical resize +5<CR>

" Auto close
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha


"""""""""""""""""""""""""""""""""""""""""""""
"              		 VIMPLUG
"""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

onoremap ii ?if (<cr>jjdi{kkf(lci(
call plug#begin()
	Plug 'edkolev/tmuxline.vim'
	Plug 'sainnhe/edge'
	Plug 'ervandew/supertab'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'
	Plug 'voldikss/vim-floaterm'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'myusuf3/numbers.vim'
	Plug 'scrooloose/syntastic'
	Plug 'ntpeters/vim-airline-colornum'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'rebelot/kanagawa.nvim'
	Plug 'folke/which-key.nvim'
	Plug 'stevearc/dressing.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'MunifTanjim/nui.nvim'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'HakonHarnes/img-clip.nvim'
	Plug 'kdheepak/lazygit.nvim'
	Plug 'bfrg/vim-cpp-modern'
	Plug '42Paris/42header'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
"              		 NERDTREE
"""""""""""""""""""""""""""""""""""""""""""""

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Refresh NERDTREE whith <cr>r
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"""""""""""""""""""""""""""""""""""""""""""""
"              		  SYNTASTIC
"""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""""""
"              		  CURSORLINE
"""""""""""""""""""""""""""""""""""""""""""""
let g:airline_colornum_enabled = 1
set cursorline
"""""""""""""""""""""""""""""""""""""""""""""
"              		  SUPERTAB
"""""""""""""""""""""""""""""""""""""""""""""
 let g:SuperTabMappingForward = '<S-tab>'
 let g:SuperTabMappingBackward = '<C-tab>'

"""""""""""""""""""""""""""""""""""""""""""""
"              		  CPP_COLORS
"""""""""""""""""""""""""""""""""""""""""""""

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
autocmd BufNewFile,BufRead *.tpp set filetype=cpp

" Highlight struct/class member variables
let g:cpp_member_highlight = 1

" Link C++ types to the original Vim syntax group
" This will make int, char, etc. use the original colors
augroup CppTypeHighlight
  autocmd!
  autocmd ColorScheme * highlight link cppType Type
  autocmd ColorScheme * highlight link cppSTLtype Type
augroup END

" Apply the colorscheme again to refresh highlights
autocmd VimEnter * colorscheme kanagawa

"""""""""""""""""""""""""""""""""""""""""""""
"			KANAGAWA
"""""""""""""""""""""""""""""""""""""""""""""
colorscheme kanagawa
