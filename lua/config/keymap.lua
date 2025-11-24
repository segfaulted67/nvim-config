-- keymaps
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({'n', 'i'}, '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({'n', 'i'}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({'n', 'i'}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({'n', 'i'}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<leader>ll', '<cmd>Lazy<CR>')
-- undo-tree
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<C-x><C-f>', vim.cmd.Oil)

