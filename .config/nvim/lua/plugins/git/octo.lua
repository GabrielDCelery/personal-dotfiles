-- TODO: needs configuring
return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  opts = {
    -- or "fzf-lua" or "snacks" or "default"
    picker = 'telescope',
    -- bare Octo command opens picker of commands
    enable_builtin = true,
    ssh_aliases = {
      ['github.com-work'] = 'github.com',
    },
  },
  keys = {
    {
      '<leader>oi',
      '<CMD>Octo issue list<CR>',
      desc = 'List GitHub Issues',
    },
    {
      '<leader>op',
      '<CMD>Octo pr list<CR>',
      desc = 'List GitHub PullRequests',
    },
    {
      '<leader>od',
      '<CMD>Octo discussion list<CR>',
      desc = 'List GitHub Discussions',
    },
    {
      '<leader>on',
      '<CMD>Octo notification list<CR>',
      desc = 'List GitHub Notifications',
    },
    {
      '<leader>os',
      function()
        require('octo.utils').create_base_search_command { include_current_repo = true }
      end,
      desc = 'Search GitHub',
    },
    {
      '<leader>ov',
      '<CMD>Octo review start<CR>',
      desc = 'Start PR Review',
    },
    {
      '<leader>oR',
      '<CMD>Octo review resume<CR>',
      desc = 'Resume PR Review',
    },
    {
      '<leader>ox',
      '<CMD>Octo review submit<CR>',
      desc = 'Submit PR Review',
    },
    {
      '<leader>oX',
      '<CMD>Octo review discard<CR>',
      desc = 'Discard PR Review',
    },
    {
      ']T',
      function()
        require('custom.octo-review-nav').next_thread_any_file()
      end,
      desc = 'Next PR Review Thread (any file)',
    },
    {
      '[T',
      function()
        require('custom.octo-review-nav').prev_thread_any_file()
      end,
      desc = 'Previous PR Review Thread (any file)',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR "ibhagwan/fzf-lua",
    -- OR "folke/snacks.nvim",
    'nvim-tree/nvim-web-devicons', -- optional if file_panel.icons is a function
  },
}
