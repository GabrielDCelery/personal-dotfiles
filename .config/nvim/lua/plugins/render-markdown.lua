return {
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- 'echasnovski/mini.nvim',
  }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    require('render-markdown').setup {
      heading = {
        position = 'inline',
        width = 'block',
        border = true,
        left_pad = 1,
        right_pad = 3,
      },
      code = {
        enabled = true,
        width = 'block',
      },
    }
  end,
}
