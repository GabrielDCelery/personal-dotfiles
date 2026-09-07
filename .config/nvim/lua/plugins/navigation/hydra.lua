return {
  'nvimtools/hydra.nvim',
  event = 'VeryLazy',
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

    -- Scope navigation hydra: jump between function/class boundaries (see
    -- plugins.navigation.treesitter-textobjects) without repeating the ]/[ prefix
    local move = require 'nvim-treesitter-textobjects.move'

    Hydra {
      name = 'Scope Navigation',
      mode = { 'n', 'x', 'o' },
      body = '<leader>f',
      heads = {
        -- lowercase = forward, Shift = backward, same key jumps the same scope
        { 'f', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function' } },
        { 'F', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev function' } },

        { 'm', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class/method' } },
        { 'M', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Prev class/method' } },

        { 'q', nil, { desc = 'Quit', exit = true } },
        { '<Esc>', nil, { desc = 'Quit', exit = true } },
      },
      hint = [[ some multiline string ]],
      config = {
        type = 'window',
        position = 'middle',
        invoke_on_body = true,
      },
    }
  end,
}
