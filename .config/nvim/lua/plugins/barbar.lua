local function closeAllBuffersExceptCurrent()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(bufs) do
    if buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
  -- Ensure we're still on the current buffer
  vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), current_buf)
end

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
  vim.keymap.set('n', '<leader>bcc', '<cmd>BufferClose<CR>', { desc = 'BufferClose (barbar)' }),
  vim.keymap.set('n', '<leader>bmp', '<cmd>BufferMovePrevious<CR>', { desc = 'BufferMovePrevious (barbar)' }),
  vim.keymap.set('n', '<leader>bmn', '<cmd>BufferMoveNext<CR>', { desc = 'BufferMoveNext (barbar)' }),
  vim.keymap.set('n', '<leader>br', '<cmd>BufferRestore<CR>', { desc = 'BufferRestore (barbar)' }),
  vim.keymap.set('n', '<leader>bco', '<cmd>BufferCloseAllButCurrent<CR>', { desc = 'BufferCloseAllButCurrent (barbar)' }),
  vim.keymap.set('n', '<leader>bcr', '<cmd>BufferCloseBuffersRight<CR>', { desc = 'BufferCloseBuffersRight (barbar)' }),
  vim.keymap.set('n', '<leader>bcl', '<cmd>BufferCloseBuffersLeft<CR>', { desc = 'BufferCloseBuffersLeft (barbar)' }),
  -- vim.keymap.set('n', '<leader>bco', closeAllBuffersExceptCurrent, { desc = 'Close all other buffers' }),
}
