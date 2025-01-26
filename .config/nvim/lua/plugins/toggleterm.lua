return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup {
        -- size = 20,
        -- open_mapping = '<C-\\>',
        open_mapping = [[<c-t>]],
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
      vim.keymap.set('t', '<C-Left>', [[<c-\><c-n><cmd>vertical resize +10<cr>]], { desc = 'Resize left' })
      vim.keymap.set('t', '<C-Right>', [[<c-\><c-n><cmd>vertical resize -10<cr>]], { desc = 'Resize right' })
      vim.keymap.set('t', '<C-Up>', [[<c-\><c-n><cmd>horizontal resize +5<cr>]], { desc = 'Resize up' })
      vim.keymap.set('t', '<C-Down>', [[<c-\><c-n><cmd>horizontal resize -5<cr>]], { desc = 'Resize down' })

      -- local Terminal = require('toggleterm.terminal').Terminal
      -- local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float', size = 100, hidden = true })
      --
      -- vim.keymap.set('n', '<leader>tl', function()
      --   lazygit:toggle()
      -- end, { desc = 'Open LazyGit in terminal' })
    end
  },
}
