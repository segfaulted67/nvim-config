return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    config = function()
      require("oil").setup({
        columns = {
          "permissions",
          "mtime",
          "size",
          "icon",
        },
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true } },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<C-l>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        view_options = {
          show_hidden = false,
        },
        preview = {
            enabled = true,
            debounce = 30,
        },
        float = {
          padding = 8,
          max_width = 0.75,
          max_height = 0.6,
          border = 1,
          win_options = {
            winblend = 0,
          },
          get_win_title = nil,
          preview_split = "auto",
          override = function(conf)
            return conf
          end,
        },
        win_options = {
          wrap = true,
          number = true,
          winbar = "Directory: %{v:lua.require('oil').get_current_dir()}",
        }
      })
    end,
  },
  {
    "benomahony/oil-git.nvim",
  },
}
