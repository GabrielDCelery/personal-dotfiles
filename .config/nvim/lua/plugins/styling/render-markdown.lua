return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'tree-sitter-grammars/tree-sitter-markdown', -- markdown parser for tree-sitter
    'tree-sitter/tree-sitter-html', -- html grammar for tree-sitter
    -- 'latex-lsp/tree-sitter-latex', -- don't need latex so disabling
    'tree-sitter-grammars/tree-sitter-yaml', -- yaml grammar for tree-sitter
    'nvim-tree/nvim-web-devicons', -- provides nerd font icons
    'nvim-mini/mini.nvim', -- to get mini icons https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-icons.md
    'hrsh7th/nvim-cmp', -- for enabling completions
  },
  config = function()
    require('render-markdown').setup {
      heading = {
        position = 'inline',
        -- width = 'block',
        width = 'full',
        border = false,
        left_pad = { 1, 2, 3, 4, 5, 6, 7, 8 },
        right_pad = 3,
      },
      code = {
        enabled = true,
        width = 'block',
      },
      latex = { enabled = false },
      completions = { lsp = { enabled = true } },
      pipe_table = { preset = 'heavy' },
    }
  end,
}
