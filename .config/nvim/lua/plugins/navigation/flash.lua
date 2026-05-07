return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      treesitter = {
        -- Dim everything except the labels, same visual behaviour as basic jump mode
        backdrop = 0.7,
      },
    },
  },
  config = function(_, opts)
    require('flash').setup(opts)
    -- High contrast label: cyan background with black text so labels are immediately visible
    -- against the dark Catppuccin Mocha background
    vim.api.nvim_set_hl(0, 'FlashLabel', { bg = '#00ffff', fg = '#000000', bold = true })
  end,
  keys = {
    {
      -- Basic jump: type 1-2 characters, flash labels all matches on screen, press label to jump.
      -- Works as a motion so operators compose with it: ds{label} deletes to target,
      -- ys{label} yanks to target, cs{label} changes to target.
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      -- Treesitter jump: labels entire structural nodes (functions, blocks, arguments) rather
      -- than character positions. Press S, pick a label to select the whole node.
      -- Use when you want to operate on a whole structure: dS deletes a function,
      -- cS changes an entire block, vS visually selects a node for further manipulation.
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      -- Remote flash: operate on text at a jump target WITHOUT moving your cursor there.
      -- Only active in operator-pending mode (after pressing d, y, c, etc.).
      -- Example: dr then pick a label then iw — deletes that word, cursor stays put.
      -- Use when you need to grab or remove something from elsewhere in the file
      -- without losing your current position. Eliminates the jump → edit → <C-o> back pattern.
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      -- Remote treesitter: same as remote flash but targets whole treesitter nodes.
      -- Type characters to search, flash labels matching nodes, pick one to operate on it remotely.
      -- Use when the thing you want to grab or delete is an entire function or block,
      -- and you don't want to navigate there to do it.
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
    -- {
    --   '<c-s>',
    --   mode = { 'c' },
    --   function()
    --     require('flash').toggle()
    --   end,
    --   desc = 'Toggle Flash Search',
    -- },
  },
}
