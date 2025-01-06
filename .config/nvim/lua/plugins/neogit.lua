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
    vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<cr>', { desc = 'NeoGit reveal' })
    vim.keymap.set('n', '<leader>gdo', '<cmd>DiffviewOpen<cr>', { desc = 'DiffviewOpen' })
    vim.keymap.set('n', '<leader>gdc', '<cmd>DiffviewClose<cr>', { desc = 'DiffviewClose' })
    vim.keymap.set('n', '<leader>gdr', '<cmd>DiffviewRefresh<cr>', { desc = 'DiffviewRefresh' })
    vim.keymap.set('n', '<leader>gdt', '<cmd>DiffviewToggleFiles<cr>', { desc = 'DiffviewToggleFiles' })
  end,
}
