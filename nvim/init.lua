-- Neovim config using lazy.nvim (plugin manager)
-- Modularized: see nvim/lua/config/* and nvim/lua/plugins/*

-- Leader must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Optional: keep reading your ~/.vimrc
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

vim.g.cpp_attributes_highlight = 1
vim.g.cpp_member_highlight = 1

require("config.options")
require("config.diagnostics")
require("config.commands")
require("config.keymaps")
require("config.lazy")
require("config.lsp")
require("config.autocmds")
