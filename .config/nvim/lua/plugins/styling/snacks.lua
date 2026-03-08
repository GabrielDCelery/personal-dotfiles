return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    animate = { enabled = true },
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    indent = { enabled = true },
    image = { enabled = true }, -- kitty support is limited (no zellij etc...)
    input = { enabled = true },
    -- picker = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true }, -- I got my own version of highlighting in my lspconfig.lua
  },
}
