return{
  {
    'https://github.com/twerth/ir_black.git'
  },
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
      "zenbones-theme/zenbones.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.zenbones_darken_comments = 60
        vim.g.zenbones_compat = 1
        vim.g.zenbones_solid_line_nr = true
        vim.g.darkness = "stark"

        vim.cmd.colorscheme('zenbones')
      end
  },
  {
    "2giosangmitom/nightfall.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- Add custom configuration here
    config = function(_, opts)
      require("nightfall").setup(opts)
      -- vim.cmd("colorscheme nightfall") -- Choose from: nightfall, deeper-night, maron, nord
    end,
  },
}
