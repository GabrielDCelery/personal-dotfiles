return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/toggleterm',
  },
  vim.keymap.set('n', '<leader>Tt', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>Tf', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>Ta', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>Tl', ':TestLast<CR>'),
  vim.keymap.set('n', '<leader>Tv', ':TestVisit<CR>'),

  vim.cmd "let g:test#javascript#runner = 'jest'",
  vim.cmd "let g:test#javascript#jest#executable = 'npx jest'",
  vim.cmd "let test#strategy = 'toggleterm'",
}
