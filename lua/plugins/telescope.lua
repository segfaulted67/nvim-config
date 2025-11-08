return{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = "➤ ",
      entry_prefix = "  ",
      initial_mode = "insert",
      layout_strategy = "horizontal", -- "horizontal", "vertical", "flex", "center"
      layout_config = {
        horizontal = { prompt_position = "top", preview_width = 0.6 },
        vertical = { mirror = false },
        width = 0.8,
        height = 0.9,
        preview_cutoff = 120,
      },
      sorting_strategy = "descending",
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      winblend = 10,  -- transparency
      color_devicons = true,
    },
}
