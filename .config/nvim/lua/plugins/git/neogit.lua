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
    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'git open' })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'git diffview open' })
    vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>', { desc = 'git diffview close' })
    vim.keymap.set('n', '<leader>gr', '<cmd>DiffviewRefresh<cr>', { desc = 'git diffview refresh' })
    vim.keymap.set('n', '<leader>gt', '<cmd>DiffviewToggleFiles<cr>', { desc = 'git diffview toggle' })
  end,
}
