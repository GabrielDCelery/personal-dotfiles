return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
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
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      go = { 'goimports', 'gofmt' },
      lua = { 'stylua' },
      javascript = { 'prettier', 'prettierd', stop_after_first = true },
      json = { 'prettier', 'prettierd', stop_after_first = true },
      jsonc = { 'prettier', 'prettierd', stop_after_first = true },
      markdown = { 'prettier', 'prettierd', 'markdownlint', stop_after_first = true },
      python = { 'isort', 'black' },
      typescript = { 'prettier', 'prettierd', stop_after_first = true },
      typescriptreact = { 'prettier', 'prettierd', stop_after_first = true },
    },
  },
}
