return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false, -- Load immediately so formatters install on startup
  dependencies = {
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      config = function()
        require('mason-tool-installer').setup {
          ensure_installed = {
            'black', -- python
            'goimports', -- go
            'isort', -- python
            'jq', -- json
            'markdownlint', -- markdown
            'prettier',
            'prettierd',
            'stylua', -- lua formatter
            'yamlfmt', -- yaml
            'yq', -- json, yaml xml formatter
          },
          auto_update = true,
          run_on_start = true,
        }
      end,
    },
  },
  config = function()
    local conform = require 'conform'

    conform.setup {
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      formatters = {
        yamlfmt = {
          prepend_args = { '-formatter', 'retain_line_breaks=true' },
        },
      },
      formatters_by_ft = {
        ['go'] = { 'goimports' },
        ['helm'] = { 'yamlfmt' },
        ['helm.yaml'] = { 'yamlfmt' },
        ['javascript'] = { 'prettier', 'prettierd', stop_after_first = true },
        ['json'] = { 'prettier', 'prettierd', 'yq', stop_after_first = true },
        ['jsonc'] = { 'prettier', 'prettierd', 'yq', stop_after_first = true },
        ['kubernetes'] = { 'yamlfmt' },
        ['lua'] = { 'stylua' },
        ['markdown'] = { 'prettier', 'prettierd', 'markdownlint', stop_after_first = true },
        ['python'] = { 'isort', 'black' },
        ['typescript'] = { 'prettier', 'prettierd', stop_after_first = true },
        ['typescriptreact'] = { 'prettier', 'prettierd', stop_after_first = true },
        ['vue'] = { 'prettier', 'prettierd', stop_after_first = true },
        ['yaml'] = { 'yamlfmt', 'yq', 'prettier', 'prettierd', stop_after_first = true },
      },
      notify_on_error = true,
    }
  end,
  keys = {
    {
      '<leader>lc',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'format conform',
    },
    -- TODO: Move this to a custom function since it does not belong to conform
    {
      '<leader>lj',
      function()
        vim.cmd '%!jq .'
      end,
      mode = '',
      desc = 'format json',
    },
    -- TODO: Move this to a custom function since it does not belong to conform
    {
      '<leader>ly',
      function()
        vim.cmd "%!yq e '.' -P"
      end,
      mode = '',
      desc = 'format yaml',
    },
  },
  -- opts = {
  --   notify_on_error = false,
  --   format_on_save = function(bufnr)
  --     -- Disable "format_on_save lsp_fallback" for languages that don't
  --     -- have a well standardized coding style. You can add additional
  --     -- languages here or re-enable it for the disabled ones.
  --     local disable_filetypes = { c = true, cpp = true }
  --     return {
  --       timeout_ms = 500,
  --       async = false,
  --       lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
  --     }
  --   end,
  --   formatters_by_ft = {
  --     ['go'] = { 'goimports' },
  --     ['lua'] = { 'stylua' },
  --     ['javascript'] = { 'prettier', 'prettierd', stop_after_first = true },
  --     ['json'] = { 'prettier', 'prettierd', 'yq', stop_after_first = true },
  --     ['markdown'] = { 'prettier', 'prettierd', 'markdownlint', stop_after_first = true },
  --     ['python'] = { 'isort', 'black' },
  --     ['typescript'] = { 'prettier', 'prettierd', stop_after_first = true },
  --     ['typescriptreact'] = { 'prettier', 'prettierd', stop_after_first = true },
  --     ['vue'] = { 'prettier', 'prettierd', stop_after_first = true },
  --     ['yaml'] = { 'yamlfmt', 'yq', 'prettier', 'prettierd', stop_after_first = true },
  --     ['helm'] = { 'yamlfmt' },
  --     ['helm.yaml'] = { 'yamlfmt' },
  --     ['kubernetes'] = { 'yamlfmt' },
  --   },
  --   formatters = {
  --     yamlfmt = {
  --       prepend_args = { '-formatter', 'retain_line_breaks=true' },
  --     },
  --   },
  -- },
}
