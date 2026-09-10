return {
  'nvimtools/hydra.nvim',
  event = 'VeryLazy',
  config = function()
    local Hydra = require 'hydra'

    -- Match hydra's hint colors to the active catppuccin palette. HydraHint/
    -- HydraBorder/HydraTitle already link to NormalFloat/FloatBorder/FloatTitle
    -- (see hydra.nvim/plugin/hydra.lua), so they follow catppuccin automatically.
    -- Only the per-head accent colors are hardcoded upstream and need overriding.
    local palette = require('catppuccin.palettes').get_palette()
    local hl = vim.api.nvim_set_hl
    hl(0, 'HydraRed', { fg = palette.red, bold = true })
    hl(0, 'HydraBlue', { fg = palette.blue, bold = true })
    hl(0, 'HydraAmaranth', { fg = palette.maroon, bold = true })
    hl(0, 'HydraTeal', { fg = palette.teal, bold = true })
    hl(0, 'HydraPink', { fg = palette.pink, bold = true })

    -- shared floating window look for every hydra hint below, matching
    -- which-key's "modern" preset: ~90% of editor width, centered, rounded
    -- border, hugging the bottom. Hydra sizes its hint window to the widest
    -- line of the hint *content* (not `float_opts.width`, which would throw
    -- off its own centering math), so we right-pad every line with spaces
    -- to the target width instead of overriding the float width directly.
    local hint_width = math.floor(vim.o.columns * 0.9)

    local function pad_hint(lines)
      local padded = {}
      for _, line in ipairs(lines) do
        local visible = vim.fn.strdisplaywidth((line:gsub('[_^]', '')))
        padded[#padded + 1] = line .. string.rep(' ', math.max(hint_width - visible, 0))
      end
      return table.concat(padded, '\n') .. '\n'
    end

    local hint_float = {
      type = 'window',
      position = 'bottom',
      float_opts = { border = 'rounded' },
    }

    -- Window management hydra
    Hydra {
      name = 'Window Management',
      mode = 'n',
      body = '<leader>w',
      heads = {
        -- Window navigation
        { 'h', '<C-w>h', { desc = 'Move left' } },
        { 'j', '<C-w>j', { desc = 'Move down' } },
        { 'k', '<C-w>k', { desc = 'Move up' } },
        { 'l', '<C-w>l', { desc = 'Move right' } },

        -- Window resizing
        { '>', '<C-w>>', { desc = 'Increase width' } },
        { '<', '<C-w><', { desc = 'Decrease width' } },
        { '+', '<C-w>+', { desc = 'Increase height' } },
        { '-', '<C-w>-', { desc = 'Decrease height' } },

        -- Window splitting
        { 's', '<C-w>s', { desc = 'Split horizontally' } },
        { 'v', '<C-w>v', { desc = 'Split vertically' } },

        -- Window equalization
        { '=', '<C-w>=', { desc = 'Equalize windows' } },

        -- Window closing
        { 'c', '<C-w>c', { desc = 'Close window' } },
        { 'o', '<C-w>o', { desc = 'Close other windows' } },

        -- Exit hydra
        { 'q', nil, { desc = 'Quit', exit = true } },
        { '<Esc>', nil, { desc = 'Quit', exit = true } },
      },
      hint = pad_hint {
        ' Navigate      Resize          Split',
        ' _h_ ←  _j_ ↓  _>_ width+  _<_ width-   _s_ horizontal',
        ' _k_ ↑  _l_ →  _+_ height+ _-_ height-  _v_ vertical',
        '',
        ' _=_ equalize   _c_ close   _o_ close others   _q_/_<Esc>_ quit',
      },
      config = {
        invoke_on_body = true,
        hint = hint_float,
      },
    }

    -- Scope navigation hydra: jump between function/class boundaries (see
    -- plugins.navigation.treesitter-textobjects) without repeating the ]/[ prefix
    local move = require 'nvim-treesitter-textobjects.move'

    Hydra {
      name = 'Scope Navigation',
      mode = { 'n', 'x', 'o' },
      body = '<leader>f',
      heads = {
        -- lowercase = forward, Shift = backward, same key jumps the same scope
        { 'f', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function' } },
        { 'F', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev function' } },

        { 'm', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class/method' } },
        { 'M', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Prev class/method' } },

        { 'q', nil, { desc = 'Quit', exit = true } },
        { '<Esc>', nil, { desc = 'Quit', exit = true } },
      },
      hint = pad_hint {
        ' _f_ next function   _F_ prev function',
        ' _m_ next class      _M_ prev class',
        '',
        ' _q_/_<Esc>_ quit',
      },
      config = {
        invoke_on_body = true,
        hint = hint_float,
      },
    }
  end,
}
