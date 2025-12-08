-- prev used cme.nvim:- "https://github.com/yilisharcs/cme.nvim"
return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  branch = "latest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      input_word_completion = true,
      bang_expansion = true,
    }
  end
}
