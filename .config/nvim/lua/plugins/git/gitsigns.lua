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
        -- map('n', '<leader>gtd', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' }) -- conflicting with toggle from neogit
        map('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next hunk' })
        map('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous hunk' })
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>ghR', gitsigns.reset_hunk, { desc = 'Reset hunk' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
        map('n', '<leader>gtm', function()
          gitsigns.change_base(require('custom.git-default-branch').get(), true)
        end, { desc = '[T]oggle diff against [m]ain/master' })
        map('n', '<leader>gtd', function()
          vim.ui.input({ prompt = 'Diff against branch: ', default = require('custom.git-default-branch').get() }, function(branch)
            if branch and branch ~= '' then
              gitsigns.change_base(branch, true)
            end
          end)
        end, { desc = '[T]oggle diff against [b]ranch' })
        map('n', '<leader>gtr', function()
          gitsigns.reset_base(true)
        end, { desc = '[T]oggle [r]eset diff base' })
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Stage selected lines' })
        -- map('n', '<leader>gD', gitsigns.diffthis, { desc = 'git [d]iff against index' }) -- not important since we have neogit
      end,
    }

    -- Global (not buffer-local) since it must also work while focus is inside
    -- the gitsigns-blame scratch buffer, which on_attach never attaches to.
    vim.keymap.set('n', '<leader>gtB', function()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'gitsigns-blame' then
          vim.api.nvim_win_close(win, true)
          return
        end
      end
      require('gitsigns').blame()
    end, { desc = '[T]oggle full buffer [B]lame (side panel, D = diff commit)' })
  end,
}
