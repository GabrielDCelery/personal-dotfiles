return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - diff integration
    'nvim-telescope/telescope.nvim', -- optional - telescope integration
    'ibhagwan/fzf-lua', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}
    vim.keymap.set('n', '<leader>go', '<cmd>Neogit<cr>', { desc = 'Neogit open' })
    vim.keymap.set('n', '<leader>gdo', '<cmd>DiffviewOpen<cr>', { desc = 'Diffview [o]pen' })
    vim.keymap.set('n', '<leader>gdc', '<cmd>DiffviewClose<cr>', { desc = 'Diffview [c]lose' })
    vim.keymap.set('n', '<leader>gdr', '<cmd>DiffviewRefresh<cr>', { desc = 'Diffview [r]efresh' })
    -- vim.keymap.set('n', '<leader>gdf', '<cmd>DiffviewToggleFiles<cr>', { desc = 'Diffview toggle [f]iles panel' })
    vim.keymap.set('n', '<leader>gdb', function()
      vim.ui.input({ prompt = 'Diff against branch: ' }, function(branch)
        if branch and branch ~= '' then
          vim.cmd('DiffviewOpen ' .. branch)
        end
      end)
    end, { desc = 'Diffview open against [b]ranch' })
  end,
}
