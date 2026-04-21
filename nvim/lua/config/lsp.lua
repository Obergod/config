-- LSP setup (C/C++ via clangd)

-- Newer Neovim can configure servers without nvim-lspconfig
if vim.lsp.config ~= nil and vim.lsp.enable ~= nil then
  vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
  })
  vim.lsp.enable("clangd")
  return
end

-- Fallback for older Neovim: use nvim-lspconfig if installed
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy" },
})
