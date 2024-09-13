-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'NeoTree reveal' }),
    --  { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    sources = {
      'filesystem',
      'git_status',
      -- 'buffers',
    },
    source_selector = {
      winbar = true,
      statusline = true,
    },
    window = {
      -- position = 'float',
      position = 'left',
      mappings = {
        ['P'] = { 'toggle_preview', config = { use_float = true } },
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    git_status = {},
  },
}
