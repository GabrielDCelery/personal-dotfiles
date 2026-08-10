return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'antoinemadec/FixCursorHold.nvim',
    'marilari88/neotest-vitest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-vitest' {
          filter_dir = function(name)
            return name ~= 'node_modules'
          end,
          vitestCommand = 'npx vitest --project unit',
        },
      },
    }

    vim.keymap.set('n', '<leader>tt', function()
      require('neotest').run.run()
    end, { desc = 'test closest' })

    vim.keymap.set('n', '<leader>tf', function()
      require('neotest').run.run(vim.fn.expand '%')
    end, { desc = 'test closest' })

    vim.keymap.set('n', '<leader>tT', function()
      require('neotest').summary.toggle()
    end, { desc = 'test toggle' })

    vim.keymap.set('n', '<leader>tO', function()
      require('neotest').output_panel.toggle()
    end, { desc = 'test output' })
  end,
}
