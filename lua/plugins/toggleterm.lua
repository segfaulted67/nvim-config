return{
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
      })
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float terminal" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })
      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
    end
  },
}
