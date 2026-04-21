-- General autocmds / filetypes

local group = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- *.tpp as C++
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = "*.tpp",
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})

local function link_cpp_types()
  vim.api.nvim_set_hl(0, "cppType", { link = "Type" })
  vim.api.nvim_set_hl(0, "cppSTLtype", { link = "Type" })
end

-- Apply now (covers the initial colorscheme load)
link_cpp_types()

-- And re-apply on any colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = link_cpp_types,
})
