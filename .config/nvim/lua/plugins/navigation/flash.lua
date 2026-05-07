return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      treesitter = {
        backdrop = 0.7,
      },
    },
  },
  config = function(_, opts)
    require('flash').setup(opts)
    vim.api.nvim_set_hl(0, 'FlashLabel', { bg = '#00ffff', fg = '#000000', bold = true })
  end,
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
    -- {
    --   '<c-s>',
    --   mode = { 'c' },
    --   function()
    --     require('flash').toggle()
    --   end,
    --   desc = 'Toggle Flash Search',
    -- },
  },
}
