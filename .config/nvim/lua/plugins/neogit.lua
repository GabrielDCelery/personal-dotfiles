return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
  },
  config = true,
  vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<cr>', { desc = 'NeoGit reveal' }),
  --  vim.keymap.set('n', '<leader>n', '<cmd>Neogit<cr>', { desc = 'NeoGit reveal' })
}
