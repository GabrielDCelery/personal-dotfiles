return {
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    -- catppuccin is not controlled via the theme integrations but here
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
      },
    }
  end,
}
