return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function()
    local whichKey = require 'which-key'
    whichKey.setup {
      preset = 'modern',
    }
    whichKey.add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = 'telescope' },
      -- { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = 'test' },
      { '<leader>h', group = 'harpoon' },
      { '<leader>g', group = 'git' },
      { '<leader>l', group = 'lint' },
      { '<leader>e', group = 'trouble' },
      { '<leader>d', group = 'debug' },
      { '<leader>a', group = 'ai' },
    }
  end,
}
