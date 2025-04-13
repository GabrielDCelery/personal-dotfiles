return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Need this to enable Telescope search of TODO comments
  },
  config = function()
    require('todo-comments').setup {
      opts = {
        signs = true,
      },
    }

    vim.keymap.set('n', '<leader>qt', '<cmd>TodoQuickFix<cr>', { desc = 'TODO quickfix' })
  end,
}
