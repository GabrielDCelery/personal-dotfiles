return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
    vim.cmd.hi 'Comment gui=none'
    require('catppuccin').setup {
      default_integrations = true,
      -- !WARN: lualine is not controlled here via the theme integrations, but the lualine plugin itself
      -- integrations = {}
      integrations = {
        noice = true,
      },
    }
  end,
}
