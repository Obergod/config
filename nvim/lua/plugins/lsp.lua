return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
        automatic_installation = true,
      })
    end,
  },
  {
    -- Only needed on older Neovim where vim.lsp.config/enable don't exist
    "neovim/nvim-lspconfig",
    enabled = function()
      return vim.lsp.config == nil or vim.lsp.enable == nil
    end,
  },
  {
    "lewis6991/hover.nvim",
    lazy = false,
    config = function()
      require("hover").setup({
        init = function()
          require("hover.providers.lsp")
        end,
        preview_opts = { border = "rounded" },
        title = true,
      })

      vim.keymap.set("n", "K", require("hover").hover, { desc = "Hover" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "Hover (select)" })
    end,
  },
}
