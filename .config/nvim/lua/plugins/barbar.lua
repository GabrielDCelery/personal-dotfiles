return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  vim.keymap.set('n', '<Tab>', '<cmd>bn<cr>', { desc = 'Navigate to next buffer' }),
  vim.keymap.set('n', '<S-Tab>', '<cmd>bp<cr>', { desc = 'Navigate to previous buffer' }),
  vim.keymap.set('n', '<leader>b', '<cmd>bdelete<CR>'),
}
