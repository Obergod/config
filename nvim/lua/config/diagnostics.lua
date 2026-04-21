-- Built-in diagnostics UI tweaks (minimal, but nicer popups)

vim.diagnostic.config({
  float = {
    border = "rounded",
    source = "if_many",
  },
  severity_sort = true,
})

-- Show diagnostics in a small floating window on CursorHold
local group = vim.api.nvim_create_augroup("user_diagnostic_float", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  group = group,
  callback = function()
    if vim.api.nvim_get_mode().mode:sub(1, 1) == "i" then
      return
    end

    local lnum = vim.fn.line(".") - 1
    local diags = vim.diagnostic.get(0, { lnum = lnum })
    if #diags == 0 then
      return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})
