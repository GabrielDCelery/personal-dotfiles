return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  -- opts = {},
  config = function()
    require('fzf-lua').setup {
      winopts = {
        height = 0.95, -- window height
        width = 0.90, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
          -- ['shift-k'] = 'up',
          -- ['shift-j'] = 'down',
        },
      },
    }
    vim.keymap.set('n', '<leader>fF', require('fzf-lua').builtin, { desc = 'fzf builtin' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'fzf files' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = 'fzf grep' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'fzf buffers' })
    vim.keymap.set('n', '<leader>fq', require('fzf-lua').quickfix, { desc = 'fzf quickfix' })
    vim.keymap.set('n', '<leader>fG', require('fzf-lua').git_status, { desc = 'fzf git status' })
    vim.keymap.set('n', '<leader>fc', require('fzf-lua').commands, { desc = 'fzf commands' })
    vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { desc = 'goto definition' })
    vim.keymap.set('n', 'gD', require('fzf-lua').lsp_declarations, { desc = 'goto declarations' }) -- WARN: This is not Goto Definition, this is Goto Declaration. For example, in C this would take you to the header.
    vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references, { desc = 'goto references' })
    vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = 'goto implementation' })
    vim.keymap.set('n', '<leader>D', require('fzf-lua').lsp_typedefs, { desc = 'type definition' })
    vim.keymap.set('n', '<leader>sd', require('fzf-lua').lsp_document_symbols, { desc = 'document symbols' })

    vim.keymap.set('n', '<leader>sF', require('fzf-lua').builtin, { desc = 'fzf builtin' })
    vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = 'fzf files' })
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'fzf grep' })
    vim.keymap.set('n', '<leader>sG', require('fzf-lua').git_status, { desc = 'fzf git status' })
    vim.keymap.set('n', '<leader>sc', require('fzf-lua').grep_curbuf, { desc = 'fzf current buffer' })
  end,
}
