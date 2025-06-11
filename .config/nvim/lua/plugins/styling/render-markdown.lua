return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  -- 'echasnovski/mini.nvim', -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    require('render-markdown').setup {
      heading = {
        position = 'inline',
        -- width = 'block',
        width = 'full',
        border = false,
        left_pad = { 1, 2, 3, 4, 5, 6, 7, 8 },
        right_pad = 3,
      },
      code = {
        enabled = true,
        width = 'block',
      },
      latex = { enabled = false },
    }
  end,
}
