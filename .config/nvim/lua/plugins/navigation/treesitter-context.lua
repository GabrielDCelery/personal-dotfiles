return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPre',
  opts = {
    max_lines = 3, -- max lines the context window can take up
    trim_scope = 'outer', -- which context lines to discard if max_lines exceeded
  },
  keys = {
    {
      '[c',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      desc = 'Jump to context',
    },
  },
}
