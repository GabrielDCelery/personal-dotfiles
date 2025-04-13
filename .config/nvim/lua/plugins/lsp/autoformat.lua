return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
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
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        async = false,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      ['go'] = { 'goimports' },
      ['lua'] = { 'stylua' },
      ['javascript'] = { 'prettier', 'prettierd', stop_after_first = true },
      ['json'] = { 'prettier', 'prettierd', 'yq', stop_after_first = true },
      ['markdown'] = { 'prettier', 'prettierd', 'markdownlint', stop_after_first = true },
      ['python'] = { 'isort', 'black' },
      ['typescript'] = { 'prettier', 'prettierd', stop_after_first = true },
      ['typescriptreact'] = { 'prettier', 'prettierd', stop_after_first = true },
      ['yaml'] = { 'yamlfmt', 'yq', 'prettier', 'prettierd', stop_after_first = true },
      ['helm'] = { 'yamlfmt' },
      ['helm.yaml'] = { 'yamlfmt' },
      ['kubernetes'] = { 'yamlfmt' },
    },
  },
}
