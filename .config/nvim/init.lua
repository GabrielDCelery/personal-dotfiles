-- Keep these at the beginning to avoid bugs
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Options/Settings
require 'options.main'
require 'options.keymap'

-- Custom code snippets
require('custom.highlight-when-yanking').init() -- highlight text when yanking
require('custom.lazy-plugin-manager').init() -- the lazy plugin manager
require('custom.autoformat-json-on-bufread').init()
require('custom.filetype').init() -- custom filetypes

require('lazy').setup({
  -- Neovim editor setup plugins
  require 'plugins.neovim.lazydev', -- auto configures the lua LSP for workspace libraries

  -- Theme/Styling
  require 'plugins.styling.theme', -- configure and load theme for editor
  require 'plugins.styling.noice', -- experimental plugin that replaces the command line and messages with a custom implementation
  require 'plugins.styling.todo-commments', -- highlight todo comments in codebase (FIX, TODO, HACK, WARN, PERF, NOTE, TEST)
  require 'plugins.styling.render-markdown', -- rendering markdown documents
  require 'plugins.styling.lualine', -- editor status bar
  require 'plugins.styling.which-key', -- displays key bindings
  require 'plugins.styling.colorizer', -- color highlighter for RGB colors
  require 'plugins.styling.web-devicons', -- nerd fonts for neovim plugins

  -- LSP/Formatting/Linting
  require 'plugins.lsp.sleuth', -- auto adjust cursor to follow indentation
  require 'plugins.lsp.lspconfig', -- language servers
  require 'plugins.lsp.autoformat', -- autoformatter
  -- require 'plugins.lsp.lint', -- linter
  require 'plugins.lsp.autocompletion', -- autocompletion
  require 'plugins.lsp.autopairs', -- auto pair brackets and quotes
  require 'plugins.lsp.spectre', -- search and replace text in the codebase

  -- Navigation/Searching
  require 'plugins.navigation.flash', -- navigate within buffer jumping to characters
  require 'plugins.navigation.neo-tree', -- browse and edit file system
  require 'plugins.navigation.harpoon', -- harpoon for pinning buffers that keep revisiting
  require 'plugins.navigation.treesitter', -- treesitter
  require 'plugins.navigation.fzflua', -- versatile fzf based search
  require 'plugins.navigation.vim-tmux-navigator', -- vim tmux navigator
  require 'plugins.navigation.vim-zellij', -- vim zellij navigator
  -- require 'plugins.navigation.hydra', -- hydra

  -- Git/Version control
  require 'plugins.git.neogit', -- built-in git GUI
  -- require 'plugins.git.fugitive',
  require 'plugins.git.gitsigns', -- git decorations

  -- Testing
  require 'plugins.testing.vim-test', -- test initiator
  require 'plugins.testing.better-quickfix', -- quickfix window
  require 'plugins.testing.trouble', -- enhanced errors window
  require 'plugins.testing.debugger', -- debugger
  -- require 'plugins.testing.ai-assistant', -- ai assistant
  require 'plugins.testing.mcp', -- mcp manager

  -- Terminal
  -- require 'plugins.terminal.toggleterm', -- inbuilt terminal
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {},
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
