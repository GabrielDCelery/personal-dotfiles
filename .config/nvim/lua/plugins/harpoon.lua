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

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hs', function()
      toggle_telescope(harpoon:list())
      vim.api.nvim_input '<Esc>'
    end, { desc = 'Open harpoon buffers in telescope' })
  end,
}
