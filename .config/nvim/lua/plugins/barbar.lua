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

  vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<cr>', { desc = 'BufferNext (barbar)' }),
  vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<cr>', { desc = 'BufferNext (barbar)' }),
  vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrevious<cr>', { desc = 'BufferPrevious (barbar)' }),
  vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<cr>', { desc = 'BufferPrevious (barbar)' }),
  vim.keymap.set('n', '<leader>bc', '<cmd>BufferClose<CR>', { desc = 'BufferClose (barbar)' }),
  vim.keymap.set('n', '<leader>bmp', '<cmd>BufferMovePrevious<CR>', { desc = 'BufferMovePrevious (barbar)' }),
  vim.keymap.set('n', '<leader>bmn', '<cmd>BufferMoveNext<CR>', { desc = 'BufferMoveNext (barbar)' }),
  vim.keymap.set('n', '<leader>br', '<cmd>BufferRestore<CR>', { desc = 'BufferRestore (barbar)' }),
}
