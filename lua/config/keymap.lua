-- keymaps
--  See `:help wincmd` for a list of all window commands
local map = vim.keymap.set
local cycle = 0

map({'n', 'i', 'v' }, '<M-x>', ':', { desc = 'Emacs type M-x' })
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


map({'n', 'i'}, '<left>', '<cmd>echo "Use h to move!!"<CR>')
map({'n', 'i'}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
map({'n', 'i'}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
map({'n', 'i'}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<localleader>l', function () require('binary-swap').swap_operands()  end)
map('n', '<localleader>j', function () require('binary-swap').swap_operands_with_operator()  end)

map('n', '<leader>ll', '<cmd>Lazy<CR>')
-- undo-tree
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

map('n', '<C-x><C-f>', vim.cmd.Oil)
-- map('n', '<leader>e', function() require("oil").open_float(".") end)
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

map("n", "<C-l>", function()
    cycle = (cycle + 1) % 3
    if cycle == 0 then
        vim.cmd("normal! zz")
    elseif cycle == 1 then
        vim.cmd("normal! zt")
    else
        vim.cmd("normal! zb")
    end
end)
