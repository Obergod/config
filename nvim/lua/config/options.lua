-- Core options (ported from init.vim)

local opt = vim.opt

opt.linebreak = true
opt.wrap = false
opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.mouse = "a"
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.wildignorecase = true
opt.scrolloff = 3
opt.cursorline = true

-- Enable classic syntax highlighting (Vimscript feature)
vim.api.nvim_command("syntax on")

