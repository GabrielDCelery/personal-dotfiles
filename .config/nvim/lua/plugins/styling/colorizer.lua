return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      'javascript',
      'typescript',
      'css',
      'go',
      'rgb',
      'hex',
      'hsl',
    }
  end,
}
