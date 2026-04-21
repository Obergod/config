-- User commands

vim.api.nvim_create_user_command("W", function()
  vim.api.nvim_command("write")
end, {})

vim.api.nvim_create_user_command("WQ", function()
  vim.api.nvim_command("writequit")
end, {})

vim.api.nvim_create_user_command("Wq", function()
  vim.api.nvim_command("writequit")
end, {})
