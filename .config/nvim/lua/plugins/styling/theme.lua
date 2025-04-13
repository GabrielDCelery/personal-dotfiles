return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
    -- change the highligting behaviour
    -- vim.cmd.gi / this is a Neovim command to set highlighting rules
    -- Comment / refers to the syntax group of comments
    -- gui=nonw / remove any special text formatting (e.g. italics) from comments
    vim.cmd.hi 'Comment gui=none'
    require('catppuccin').setup {
      default_integrations = true,
      -- !WARN: lualine is not controlled here via the theme integrations, but the lualine plugin itself
      -- integrations = {}
      integrations = {
        noice = true,
        harpoon = true,
      },
    }
  end,
}
