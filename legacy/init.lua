-- Neovim config using lazy.nvim (plugin manager)
-- Ported from init.vim, keeping a Vimscript-like style via vim.cmd blocks.

-- Leader must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Optional: keep reading your ~/.vimrc if present (without altering packpath)
vim.cmd([[
if filereadable(expand("~/.vimrc"))
  source ~/.vimrc
endif
]])

-- Globals / plugin variables (set early)
vim.g.user42 = "mafioron"
vim.g.mail42 = "mafioron@student.42.fr"

vim.g.airline_colornum_enabled = 1
vim.g.SuperTabMappingForward = "<S-tab>"
vim.g.SuperTabMappingBackward = "<C-tab>"

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0

vim.g.cpp_attributes_highlight = 1
vim.g.cpp_member_highlight = 1

-- Core options / commands / mappings (kept close to your init.vim)
vim.cmd([[
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
set scrolloff=3
set cursorline

command! W :w
command! WQ :wq
command! Wq :wq

nnoremap <leader>T :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=floaterm<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>b :Telescope buffers<cr>
nnoremap <leader>f :Telescope find_files<cr>
nnoremap <leader>t :Telescope<cr>
nnoremap <leader>o gT
nnoremap <leader>p gt

""""""""""""""""""""""""""""""""""""""""""""""""""""
"               My remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Your text object-ish mapping
onoremap ii ?if (<cr>jjdi{kkf(lci(
]])

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins (ported from your vim-plug list)
require("lazy").setup({
  -- UI / statusline
  { "vim-airline/vim-airline", lazy = false },
  { "vim-airline/vim-airline-themes" },
  { "ntpeters/vim-airline-colornum", lazy = false },

  -- Themes
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000, config = function()
      vim.cmd([[colorscheme kanagawa]])
    end },
  { "sainnhe/edge" },

  -- File tree / terminal
  { "preservim/nerdtree", lazy = false },
  { "voldikss/vim-floaterm", cmd = { "FloatermNew", "FloatermToggle", "FloatermShow" } },

  -- Fuzzy finder
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", cmd = "Telescope", dependencies = { "nvim-lua/plenary.nvim" } },

  -- LSP / linting (kept as-is from your setup)
  { "prabirshrestha/vim-lsp", lazy = false },
  { "scrooloose/syntastic", lazy = false },

  -- Editing helpers
  { "ervandew/supertab", lazy = false },
  { "myusuf3/numbers.vim", lazy = false },

  -- Misc
  { "edkolev/tmuxline.vim" },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "HakonHarnes/img-clip.nvim", opts = {}, event = "VeryLazy" },
  { "kdheepak/lazygit.nvim", cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" } },
  { "bfrg/vim-cpp-modern" },
  { "42Paris/42header" },
}, {
  checker = { enabled = true },
})

-- Autocmds / highlights (ported from your init.vim)
vim.cmd([[
" NERDTREE
" Start NERDTree when started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Refresh NERDTREE with <Leader>r
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" SYNTASTIC statusline hook
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" CPP filetype + highlight links
autocmd BufNewFile,BufRead *.tpp set filetype=cpp
augroup CppTypeHighlight
  autocmd!
  autocmd ColorScheme * highlight link cppType Type
  autocmd ColorScheme * highlight link cppSTLtype Type
augroup END
]])
