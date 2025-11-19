return{
  'stevearc/quicker.nvim',
  ft = "qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  config = function()
    require("quicker").setup()
  end,
  opts = {},
}
