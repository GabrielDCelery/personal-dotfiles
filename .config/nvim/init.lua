vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require 'options.main'
require 'options.keymap'
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.lazydev', -- auto configures the lua LSP for editing neovim configurations
  require 'plugins.theme', -- configure and load theme for editor
  require 'plugins.sleuth', -- auto adjust cursor to follow indentation
  require 'plugins.flash', -- navigate within buffer jumping to characters
  require 'plugins.spectre', -- search and replace text in the codebase
  require 'plugins.neogit', -- built-in git GUI
  require 'plugins.todo-commments', -- highlight todo comments in codebase (FIX, TODO, HACK, WARN, PERF, NOTE, TEST)
  require 'plugins.neo-tree', -- browse and edit file system
  require 'plugins.harpoon', -- harpoon for pinning buffers that keep revisiting
  require 'plugins.gitsigns', -- git decorations
  require 'plugins.which-key', -- displays key bindings
  require 'plugins.telescope',
  -- require 'plugins.telescope-diff', -- diff tool using telescope (never ended up using but havent made up my mind yed)
  require 'plugins.better-quickfix', -- quickfix window
  -- require 'plugins.luvit-meta',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.autocompletion',
  -- require 'plugins.mini',
  require 'kickstart.plugins.treesitter',
  require 'plugins.vim_tmux_navigator',
  -- require 'custom.plugins.vim_test',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require 'plugins.vim-test',
  require 'plugins.vimux',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- require 'plugins.telescope-file-browser',
  require 'plugins.trouble',
  -- require 'plugins.barbar',
  require 'plugins.autoclose',
  require 'plugins.render-markdown',
  require 'plugins.dadbod',
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
