local language_servers = {
  'bashls', -- bash -- https://github.com/bash-lsp/bash-language-server
  'buf_ls', -- protocol buffer -- https://github.com/bufbuild/buf
  -- 'cmake',
  -- 'dagger',
  'dockerls',
  'docker_compose_language_service',
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
  -- 'volar',
  'yamlls',
}

local language_servers_new = {
  'bashls', -- bash -- https://github.com/bash-lsp/bash-language-server
  'buf_ls', -- protocol buffer -- https://github.com/bufbuild/buf
  'dockerls',
  'docker_compose_language_service',
  'lua_ls',
  'rust_analyzer',
}

local formatters = {
  'black',        -- python
  'isort',        -- python
  'goimports',    -- go
  'jq',           -- json
  'markdownlint', -- markdown
  'prettier',
  'prettierd',
  'stylua',  -- lua formatter
  'yamlfmt', -- yaml
  'yq',      -- json, yaml xml formatter
}

local linters = {
  'eslint_d',
  'tflint',
  'jsonlint',
  'yamllint',
  'hadolint',
}

-- vim.list_extend(language_servers, formatters)
-- vim.list_extend(language_servers, linters)

return language_servers_new
