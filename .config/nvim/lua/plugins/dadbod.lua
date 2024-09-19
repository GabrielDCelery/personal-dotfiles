return {
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-completion',
  'kristijanhusak/vim-dadbod-ui',
  vim.keymap.set('n', '<leader>dt', '<cmd>DBUIToggle<CR>', { desc = 'Toggle DadBod' }),
}
