return { -- scrollbar showing cursor position, diagnostics, search results and git hunks
  'petertriho/nvim-scrollbar',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  event = 'BufReadPost',
  config = function()
    local scrollbar = require 'scrollbar'
    local palette = require('catppuccin.palettes').get_palette()
    scrollbar.setup {
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = false,
      },
      handle = {
        text = ' ',
        blend = 80, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = palette.pink,
        color_nr = nil, -- cterm
        highlight = 'CursorColumn',
        hide_if_all_visible = true, -- Hides handle if all lines are visible
      },
    }
  end,
}
