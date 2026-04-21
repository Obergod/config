-- NERDTree behavior in Lua (autostart/mirror/auto-quit)

local group = vim.api.nvim_create_augroup("user_nerdtree", { clear = true })

vim.api.nvim_create_autocmd("StdinReadPre", {
  group = group,
  callback = function()
    vim.g._std_in = 1
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end
    if vim.g._std_in == 1 then
      return
    end
    if vim.fn.exists(":NERDTree") ~= 2 then
      return
    end
    pcall(vim.api.nvim_command, "NERDTree")
    pcall(vim.api.nvim_command, "wincmd p")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  callback = function()
    if vim.fn.tabpagenr("$") ~= 1 or vim.fn.winnr("$") ~= 1 then
      return
    end
    if vim.fn.exists("b:NERDTree") ~= 1 then
      return
    end

    local ok, is_tab_tree = pcall(vim.fn.eval, "b:NERDTree.isTabTree()")
    if ok and is_tab_tree == 1 then
      pcall(vim.api.nvim_command, "quit")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  callback = function()
    if vim.fn.getcmdwintype() ~= "" then
      return
    end
    if vim.fn.exists(":NERDTreeMirror") ~= 2 then
      return
    end
    pcall(vim.api.nvim_command, "silent NERDTreeMirror")
  end,
})
