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
    vim.keymap.set('n', '<leader>dc', ':DapContinue<cr>', { noremap = true, desc = 'continue' })
    vim.keymap.set('n', '<leader>dR', function()
      require('dapui').open { reset = true }
    end, { noremap = true, desc = 'reset' })
    vim.keymap.set('n', '<leader>di', ':DapStepInto<cr>', { noremap = true, desc = 'step into' })
    vim.keymap.set('n', '<leader>do', ':DapStepOut<cr>', { noremap = true, desc = 'step out' })
    vim.keymap.set('n', '<leader>dv', ':DapStepOver<cr>', { noremap = true, desc = 'step over' })
    vim.keymap.set('n', '<leader>dC', ':DapClearBreakpoints<cr>', { noremap = true, desc = 'toggle conditional breakpoint' })

    vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#f5c2e7' })

    vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { ctermbg = 0, fg = '#f5c2e7' })

    vim.fn.sign_define('DapLogPoint', { text = '󱙓 ', texthl = 'DapLogPoint', linehl = '', numhl = '' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#94e2d5' })

    vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#fab387' })

    vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
    vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { ctermbg = 0, fg = '#f38ba8' })
  end,
}
