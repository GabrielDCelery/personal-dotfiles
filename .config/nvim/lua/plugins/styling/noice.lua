return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  -- opts = {},
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    {
      'echasnovski/mini.nvim',
      version = false,
    },
    'hrsh7th/nvim-cmp',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- 'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- center the search command line to the middle
        command_palette = false, -- position the cmdline to the middle
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a clear visible border around hover documentation (`K`) and the popup that shows function parameters as you type
      },
    }
  end,
}
