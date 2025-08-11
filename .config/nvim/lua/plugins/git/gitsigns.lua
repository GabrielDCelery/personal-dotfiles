return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Toggles
        -- map('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = 'Preview hunk' }) -- dont know if I need this
        -- map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' }) -- prefer having blame turned on all the time
        map('n', '<leader>gtd', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' }) -- conflicting with toggle from neogit
        map('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next hunk' })
        map('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous hunk' })
        -- map('n', '<leader>gD', gitsigns.diffthis, { desc = 'git [d]iff against index' }) -- not important since we have neogit
      end,
    }
  end,
}
