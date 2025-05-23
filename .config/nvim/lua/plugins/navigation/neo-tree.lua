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
    vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<cr>', { desc = 'neotree' }),
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
      show_relative_path = true,
      show_unique_filename = true,
      show_modified_items = true,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        visible = true, -- This shows hidden files
        hide_dotfiles = false, -- This shows files starting with a dot
        hide_gitignored = true, -- This hides files in .gitignore
        hide_by_name = { -- This gets hidden even though it is a dotfile and dotfiles are configured not to be hidden
          '.git',
        },
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
