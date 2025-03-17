--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move up down half a page then re-center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half a page then re-center' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +10<cr>', { desc = "Increase width" })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -10<cr>', { desc = "Decrease width" })
vim.keymap.set('n', '<C-Up>', '<cmd>horizontal resize +5<cr>', { desc = "Increase height" })
vim.keymap.set('n', '<C-Down>', '<cmd>horizontal resize -5<cr>', { desc = "Decrease height" })

-- vim.keymap.set('n', '<leader>hc', '<cmd>helpclose<CR>', { desc = 'Close help' })

-- vim.keymap.set('n', '<leader>q', '<cmd>:q<CR>', { desc = 'Quit' })

vim.keymap.set('n', '<leader>pw', 'viw"_dP', {
  noremap = true,
  silent = true,
  desc = 'Paste inner word below cursor with the contents of default register but do not yank it',
})
