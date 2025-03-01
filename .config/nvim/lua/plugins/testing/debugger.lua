return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go', --nicities for go
  },
  config = function()
    require('dapui').setup()
    require('dap-go').setup()

    vim.keymap.set('n', '<leader>dt', require('dapui').toggle, { noremap = true, desc = 'toggle debugger' })
    vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<cr>', { noremap = true, desc = 'toggle breakpoint' })
    vim.keymap.set('n', '<leader>dc', ':DapContinue', { noremap = true, desc = 'continue' })
    vim.keymap.set('n', '<leader>dr', function()
      require('dapui').open { reset = true }
    end, { noremap = true, desc = 'reset' })
    vim.keymap.set('n', '<leader>dsi', ':DapStepInto<cr>', { noremap = true, desc = 'step into' })
    vim.keymap.set('n', '<leader>dso', ':DapStepOut<cr>', { noremap = true, desc = 'step out' })
    vim.keymap.set('n', '<leader>dsv', ':DapStepOver<cr>', { noremap = true, desc = 'step over' })
  end,
}
