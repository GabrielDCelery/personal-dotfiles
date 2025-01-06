return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup {}

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Add buffer go harpoon' })

    -- vim.keymap.set('n', '<leader>hd', function()
    --   local curr_buf_path = vim.fn.expand '%:p'
    --   for i, buf in ipairs(harpoon:list()) do
    --     if buf == curr_buf_path then
    --       harpoon:list().remove_at(harpoon:list(), i)
    --       return
    --     end
    --   end
    -- end, { desc = 'Remove buffer from harpoon' })

    vim.keymap.set('n', '<Tab>', function()
      harpoon:list():next()
    end, { desc = 'Move to next harpoon buffer' })

    vim.keymap.set('n', '<S-Tab>', function()
      harpoon:list():prev()
    end, { desc = 'Move to next harpoon buffer' })

    vim.keymap.set('n', '<leader>he', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Edit harpoon buffers' })

    -- INFO: Telescope settings for harpoon

    local pickers = require 'telescope.pickers'
    local finders = require 'telescope.finders'
    local sorters = require 'telescope.sorters'
    local conf = require('telescope.config').values

    local function reverse_table(table_to_reverse)
      local reversed_table = {}
      for i, v in ipairs(table_to_reverse) do
        reversed_table[#table_to_reverse + 1 - i] = v
      end
      return reversed_table
    end

    local function toggle_telescope(harpoon_files, opts)
      opts = opts or {}

      local file_paths = {}

      for _, item in ipairs(reverse_table(harpoon_files.items)) do
        table.insert(file_paths, item.value)
      end

      pickers
        .new(opts, {
          prompt_title = 'Harpoon',
          finder = finders.new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = sorters.get_fzy_sorter(opts),
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hs', function()
      toggle_telescope(harpoon:list(), {})
      vim.api.nvim_input '<Esc>'
    end, { desc = 'Open harpoon buffers in telescope' })
  end,
}
