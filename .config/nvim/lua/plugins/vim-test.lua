return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>'),
  vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>'),

  vim.cmd "let g:test#javascript#runner = 'jest'",
  vim.cmd "let g:test#javascript#jest#executable = 'npx jest'",
  vim.cmd "let test#strategy = 'vimux'",
}
