local language_servers = {
  'bashls',
  'buf_ls',
  'cmake',
  'dagger',
  'dockerls',
  'eslint',
  'gopls',
  'helm-ls',
  'jsonls',
  'html',
  'lemminx',
  'lua_ls',
  -- 'nil_ls',
  'yamlls',
  'markdown_oxide',
  'pyright',
  'rust_analyzer',
  'solargraph',
  'templ',
  'terraformls',
  'ts_ls',
  'volar',
  'yamlls',
}

local formatters = {
  'black', -- python
  'isort', -- python
  'goimports', -- go
  'jq', -- json
  'markdownlint', -- markdown
  'prettier',
  'prettierd',
  'stylua', -- lua formatter
  'yamlfmt', -- yaml
  'yq', -- json, yaml xml formatter
}

local linters = {
  'eslint_d',
  'tflint',
  'jsonlint',
  'yamllint',
  'hadolint',
}

vim.list_extend(language_servers, formatters)
vim.list_extend(language_servers, linters)

return language_servers
