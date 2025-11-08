return{
  {
    "junegunn/fzf",
    run = function() vim.fn['fzf#install']() end
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    lazy = false,
  },
}
