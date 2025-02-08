return {
  'kdheepak/lazygit.nvim',
  config = function()
    vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>', { desc = 'Open LazyGit' })
  end,
}
