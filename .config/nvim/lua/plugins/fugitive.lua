return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
    vim.keymap.set('n', '<leader>ga', '<cmd>Gwrite<cr>', { desc = 'Git add' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = 'Git blame' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
    vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<cr>', { desc = 'Git pull' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Git log' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
  end,
}
