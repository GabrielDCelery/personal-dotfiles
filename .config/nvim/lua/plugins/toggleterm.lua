return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup {
        -- size = 20,
        -- open_mapping = '<C-\\>',
        open_mapping = [[<c-\>]],
        size = function(term)
          if term.direction == 'horizontal' then
            return 20
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.38
          else
            return 20
          end
        end,
        direction = 'vertical',
        float_opts = {
          border = 'double'
        }
      }

      vim.keymap.set('t', '<Esc><Esc>', [[<c-\><c-n>]], { desc = 'Move left' })
      vim.keymap.set('t', '<C-h>', [[<c-\><c-n><c-W>h]], { desc = 'Move left' })
      vim.keymap.set('t', '<C-j>', [[<c-\><c-n><c-W>j]], { desc = 'Move down' })
      vim.keymap.set('t', '<C-k>', [[<c-\><c-n><c-W>k]], { desc = 'Move up' })
      vim.keymap.set('t', '<C-l>', [[<c-\><c-n><c-W>l]], { desc = 'Move right' })
    end
  },
}
