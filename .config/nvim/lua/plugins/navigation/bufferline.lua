return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'tabs', -- show actual tabpages (e.g. Diffview's own tab vs your normal tab), not per-buffer tabs
      diagnostics = 'nvim_lsp',
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  },
}
