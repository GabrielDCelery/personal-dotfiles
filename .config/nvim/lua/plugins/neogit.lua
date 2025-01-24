return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - diff integration
    'nvim-telescope/telescope.nvim', -- optional - telescope integration
    'ibhagwan/fzf-lua', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}
    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Open Neogit' })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'DiffviewOpen' })
    vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>', { desc = 'DiffviewClose' })
    vim.keymap.set('n', '<leader>gr', '<cmd>DiffviewRefresh<cr>', { desc = 'DiffviewRefresh' })
    vim.keymap.set('n', '<leader>gt', '<cmd>DiffviewToggleFiles<cr>', { desc = 'DiffviewToggleFiles' })
  end,
}
