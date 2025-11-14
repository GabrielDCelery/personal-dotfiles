return {
  'swaits/zellij-nav.nvim',
  lazy = false,
  config = function()
    require('zellij-nav').setup()
    vim.keymap.set('n', '<c-h>', '<cmd>ZellijNavigateLeft<cr>', { desc = 'navigate left' })
    vim.keymap.set('n', '<c-j>', '<cmd>ZellijNavigateDown<cr>', { desc = 'navigate down' })
    vim.keymap.set('n', '<c-k>', '<cmd>ZellijNavigateUp<cr>', { desc = 'navigate up' })
    vim.keymap.set('n', '<c-l>', '<cmd>ZellijNavigateRight<cr>', { desc = 'navigate right' })
  end,
}
