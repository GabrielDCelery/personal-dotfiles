return {
  'tpope/vim-fugitive',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'Git' },
  keys = {
    {
      '<leader>G',
      '<cmd>Git<CR><C-w>H',
      desc = '[G]it',
    },
  },
}
