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
  require 'plugins.sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.spectre',
  require 'plugins.better-quickfix',
  require 'plugins.lazydev',
  require 'plugins.luvit-meta',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.autocompletion',
  require 'plugins.todo-commments',
  -- require 'plugins.mini',
  require 'kickstart.plugins.treesitter',
  require 'plugins.theme',
  require 'plugins.vim_tmux_navigator',
  -- require 'custom.plugins.vim_test',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'plugins.vim-test',
  require 'plugins.vimux',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
  -- require 'plugins.telescope-file-browser',
  require 'plugins.trouble',
  -- require 'plugins.neogit',
  require 'plugins.barbar',
  require 'plugins.autoclose',
  require 'plugins.render-markdown',
  require 'plugins.dadbod',
  require 'plugins.lualine',
  require 'plugins.fugitive',
  -- require 'plugins.lazygit',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {},
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
