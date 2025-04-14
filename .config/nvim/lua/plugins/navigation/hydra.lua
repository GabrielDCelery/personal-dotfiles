return {
  'nvimtools/hydra.nvim',
  config = function()
    local Hydra = require 'hydra'

    -- Window management hydra
    Hydra {
      name = 'Window Management',
      mode = 'n',
      body = '<leader>w',
      heads = {
        -- Window navigation
        { 'h', '<C-w>h', { desc = 'Move left' } },
        { 'j', '<C-w>j', { desc = 'Move down' } },
        { 'k', '<C-w>k', { desc = 'Move up' } },
        { 'l', '<C-w>l', { desc = 'Move right' } },

        -- Window resizing
        { '>', '<C-w>>', { desc = 'Increase width' } },
        { '<', '<C-w><', { desc = 'Decrease width' } },
        { '+', '<C-w>+', { desc = 'Increase height' } },
        { '-', '<C-w>-', { desc = 'Decrease height' } },

        -- Window splitting
        { 's', '<C-w>s', { desc = 'Split horizontally' } },
        { 'v', '<C-w>v', { desc = 'Split vertically' } },

        -- Window equalization
        { '=', '<C-w>=', { desc = 'Equalize windows' } },

        -- Window closing
        { 'c', '<C-w>c', { desc = 'Close window' } },
        { 'o', '<C-w>o', { desc = 'Close other windows' } },

        -- Exit hydra
        { 'q', nil, { desc = 'Quit', exit = true } },
        { '<Esc>', nil, { desc = 'Quit', exit = true } },
      },
      hint = [[ some multiline string ]],
      config = {
        type = 'window',

        position = 'middle',
        -- color = 'pink',
        invoke_on_body = true,
        -- hint = {
        --   border = 'rounded',
        --   position = 'middle',
        -- },
      },
    }
  end,
}
