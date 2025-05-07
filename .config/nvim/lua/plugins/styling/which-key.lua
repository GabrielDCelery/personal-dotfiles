return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function()
    local whichKey = require 'which-key'
    whichKey.setup {
      preset = 'modern',
    }
    whichKey.add {
      { '<leader>c', group = 'code' },
      { '<leader>d', group = 'document' },
      { '<leader>r', group = 'rename' },
      { '<leader>s', group = 'telescope' },
      -- { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = 'test' },
      { '<leader>h', group = 'harpoon' },
      { '<leader>g', group = 'git' },
      { '<leader>l', group = 'lint' },
      { '<leader>e', group = 'trouble' },
      { '<leader>d', group = 'debug' },
      { '<leader>a', group = 'ai' },
      { '<leader>q', group = 'quickfix' },
      { '<leader>f', group = 'fzf' },
    }
  end,
}
