return{
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require('mini.bracketed').setup()
    require("mini.bufremove").setup()
    require("mini.cursorword").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()
    require("mini.move").setup()
    -- require("mini.pairs").setup()
    require("mini.jump").setup()
    require("mini.pick").setup()
    -- require("mini.snippets").setup()
    -- require("mini.completion").setup()
    require("mini.cmdline").setup()
  end,
}
