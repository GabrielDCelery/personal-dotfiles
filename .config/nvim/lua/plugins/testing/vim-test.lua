return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/toggleterm',
  },
  vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>', { desc = 'test closest' }),
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = 'test file' }),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { desc = 'test all' }),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = 'test last' }),
  vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>', { desc = 'test visit' }),

  vim.cmd "let g:test#javascript#runner = 'jest'",
  vim.cmd "let g:test#javascript#jest#executable = 'npx jest'",
  vim.cmd "let test#strategy = 'toggleterm'",
}
