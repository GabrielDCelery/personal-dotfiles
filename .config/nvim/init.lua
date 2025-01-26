vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options.main'
require 'options.keymap'

require('custom.highlight-when-yanking').init()
require('custom.lazy-plugin-manager').init()

require('lazy').setup({
  require 'plugins.theme',               -- configure and load theme for editor
  require 'plugins.lazydev',             -- auto configures the lua LSP for editing neovim configurations
  require 'kickstart.plugins.lspconfig', -- configuring lsp
  require 'plugins.sleuth',              -- auto adjust cursor to follow indentation
  require 'plugins.flash',               -- navigate within buffer jumping to characters
  require 'plugins.spectre',             -- search and replace text in the codebase
  require 'plugins.neogit',              -- built-in git GUI
  require 'plugins.todo-commments',      -- highlight todo comments in codebase (FIX, TODO, HACK, WARN, PERF, NOTE, TEST)
  require 'plugins.neo-tree',            -- browse and edit file system
  require 'plugins.harpoon',             -- harpoon for pinning buffers that keep revisiting
  require 'plugins.gitsigns',            -- git decorations
  require 'plugins.which-key',           -- displays key bindings
  require 'plugins.telescope',           -- telescope
  require 'plugins.better-quickfix',     -- quickfix window
  require 'plugins.autopairs',           -- plugin to auto pair brackets and quotes
  require 'plugins.autoformat',          -- autoformatter (e.g. prettier)
  -- require 'plugins.vim_tmux_navigator',  -- this helps navigating between neovim windows and tmux panes
  require 'plugins.toggleterm',          -- inbuilt terminal
  require 'plugins.vim-test',

  -- require 'plugins.telescope-diff', -- diff tool using telescope (never ended up using but havent made up my mind yed)
  -- require 'plugins.luvit-meta',
  require 'kickstart.plugins.autocompletion',
  -- require 'plugins.mini',
  -- require 'custom.plugins.vim_test',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'plugins.vimux',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- require 'plugins.telescope-file-browser',
  require 'plugins.trouble',
  -- require 'plugins.barbar',
  -- require 'plugins.autoclose',
  require 'plugins.render-markdown',
  -- require 'plugins.dadbod',
  require 'plugins.lualine',
  -- require 'plugins.fugitive',
  -- require 'plugins.lazygit',
  -- require 'plugins.leap',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {},
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
