return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'master',
    },
  },
  config = function()
    local languages = {
      'bash',
      'c',
      'diff',
      'go',
      'html',
      'javascript',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'nix',
      'python',
      'query',
      'rust',
      'terraform',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'zig',
    }

    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = languages,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
