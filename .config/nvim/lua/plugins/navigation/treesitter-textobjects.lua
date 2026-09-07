-- nvim-treesitter-textobjects: scope-aware jumping and text objects for
-- functions and classes/methods (main branch, matches the new nvim-treesitter main API)
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  event = 'BufReadPre',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = {
        lookahead = true,
        selection_modes = {
          ['@function.outer'] = 'V',
          ['@class.outer'] = 'V',
        },
      },
      move = {
        set_jumps = true,
      },
    }

    local move = require 'nvim-treesitter-textobjects.move'
    local select = require 'nvim-treesitter-textobjects.select'

    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = desc })
    end

    -- jump to next/previous function start/end
    map({ 'n', 'x', 'o' }, ']f', function()
      move.goto_next_start('@function.outer', 'textobjects')
    end, 'Next function start')
    map({ 'n', 'x', 'o' }, ']F', function()
      move.goto_next_end('@function.outer', 'textobjects')
    end, 'Next function end')
    map({ 'n', 'x', 'o' }, '[f', function()
      move.goto_previous_start('@function.outer', 'textobjects')
    end, 'Prev function start')
    map({ 'n', 'x', 'o' }, '[F', function()
      move.goto_previous_end('@function.outer', 'textobjects')
    end, 'Prev function end')

    -- jump to next/previous class/method start/end
    map({ 'n', 'x', 'o' }, ']m', function()
      move.goto_next_start('@class.outer', 'textobjects')
    end, 'Next class/method start')
    map({ 'n', 'x', 'o' }, ']M', function()
      move.goto_next_end('@class.outer', 'textobjects')
    end, 'Next class/method end')
    map({ 'n', 'x', 'o' }, '[m', function()
      move.goto_previous_start('@class.outer', 'textobjects')
    end, 'Prev class/method start')
    map({ 'n', 'x', 'o' }, '[M', function()
      move.goto_previous_end('@class.outer', 'textobjects')
    end, 'Prev class/method end')

    -- select function/class text objects, e.g. daf, vic, yaf
    map({ 'x', 'o' }, 'af', function()
      select.select_textobject('@function.outer', 'textobjects')
    end, 'Select around function')
    map({ 'x', 'o' }, 'if', function()
      select.select_textobject('@function.inner', 'textobjects')
    end, 'Select inner function')
    map({ 'x', 'o' }, 'ac', function()
      select.select_textobject('@class.outer', 'textobjects')
    end, 'Select around class')
    map({ 'x', 'o' }, 'ic', function()
      select.select_textobject('@class.inner', 'textobjects')
    end, 'Select inner class')
  end,
}
