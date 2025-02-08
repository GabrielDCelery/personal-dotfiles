return {
  'nvim-pack/nvim-spectre',
  config = function()
    local spectre = require 'spectre'
    local function toggle_spectre()
      spectre.toggle()
      vim.api.nvim_input '<CR>'
    end
    vim.keymap.set('n', '<leader>S', toggle_spectre, { desc = 'Toggle Spectre' })
  end,
}
