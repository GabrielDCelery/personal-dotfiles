return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    -- Configure catppuccin FIRST
    require('catppuccin').setup {
      default_integrations = true,
      -- !WARN: lualine is not controlled here via the theme integrations, but the lualine plugin itself
      -- integrations = {}
      integrations = {
        noice = true,
        harpoon = true,
      },
      -- transparent_background = true,
      -- float = {
      --   transparent = true, -- enable transparent floating windows
      --   solid = false, -- use solid styling for floating windows, see |winborder|
      -- },
    }

    -- THEN apply the colorscheme with the transparency settings
    vim.cmd.colorscheme 'catppuccin-mocha'

    -- change the highlighting behaviour
    -- vim.cmd.hi / this is a Neovim command to set highlighting rules
    -- Comment / refers to the syntax group of comments
    -- gui=none / remove any special text formatting (e.g. italics) from comments
    vim.cmd.hi 'Comment gui=none'
  end,
}
