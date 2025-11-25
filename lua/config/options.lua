-- Emacs type shi
local function update_scrolljump()
  local height = vim.api.nvim_win_get_height(0)
  vim.opt.scrolljump = math.floor(height/2)
end
update_scrolljump()
vim.api.nvim_create_autocmd("VimResized", {
    callback = update_scrolljump,
})


-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save = vim.fn.winsaveview()  -- keep cursor position
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(save)
    end,
})
