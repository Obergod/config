return {
  {
    "preservim/nerdtree",
    lazy = false,
    config = function()
      require("config.nerdtree")

      vim.keymap.set("n", "<leader>r", function()
        if vim.fn.exists(":NERDTreeFocus") ~= 2 then
          return
        end
        pcall(vim.api.nvim_command, "NERDTreeFocus")
        vim.api.nvim_feedkeys("R", "n", false)
        pcall(vim.api.nvim_command, "wincmd p")
      end, { desc = "NERDTree refresh" })
    end,
  },
}
