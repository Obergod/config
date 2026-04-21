-- Keymaps/remaps (kept close to init.vim; vim.cmd style)

vim.cmd([[
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
