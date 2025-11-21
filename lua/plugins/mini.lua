return{
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require('mini.bracketed').setup()
    require("mini.bufremove").setup()
    require("mini.cursorword").setup()
    require("mini.comment").setup()
    require("mini.splitjoin").setup()  
    require("mini.surround").setup()
    require("mini.move").setup()
    -- require("mini.pairs").setup()
    require("mini.jump").setup()
    require("mini.files").setup({
      options = {
        use_as_default_explorer = true,
      },
    })
    require("mini.pick").setup()
    -- require("mini.snippets").setup()
    -- require("mini.completion").setup()
  end,
}
