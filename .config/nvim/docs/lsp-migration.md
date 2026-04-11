# LSP Migration Plan

## Current State

### What's active

- `lspconfig.lua` — does everything: mason setup, mason-lspconfig, diagnostics UI, LspAttach keymaps, `vim.lsp.config` calls, and a `handlers` table
- `autoformat.lua` — conform.nvim, clean, no issues
- `autocompletion.lua` — nvim-cmp, clean, no issues
- `autopairs.lua` — clean, no issues
- `sleuth.lua` — clean, no issues
- `spectre.lua` — clean, no issues

### Dead code

- `lint.lua` — disabled in `init.lua`, never runs
- `lspservers.lua` — never required anywhere, has two conflicting lists and returns only 6 servers

## What's Wrong

### `lspconfig.lua` is doing too much

Single file responsible for installing servers (mason), configuring servers (lspconfig), diagnostics UI, keymaps, and per-server settings. Hard to navigate and reason about.

### `handlers` table is bypassed

`automatic_enable = true` in mason-lspconfig causes servers to start via `vim.lsp.enable()`, which skips the `handlers` table entirely. Any per-server config inside handlers silently does nothing.

### `defaultLspCapabilities` is nil

Was refactored into `vim.lsp.config('*', {...})` in commit `74a0d70` but the `handlers` references were never updated. Since handlers are bypassed anyway this doesn't cause visible errors, but the code is misleading.

### No single source of truth for server list

`lspconfig.lua` has `ensure_installed` hardcoded inline. `lspservers.lua` has two lists (`language_servers` and `language_servers_new`) and is never used. Which list is authoritative is unclear.

## Target State

### File responsibilities

| File                 | Owns                                                            |
| -------------------- | --------------------------------------------------------------- |
| `lspconfig.lua`      | mason setup, diagnostics UI config, LspAttach keymaps           |
| `lspservers.lua`     | single list of servers + per-server `vim.lsp.config(...)` calls |
| `autoformat.lua`     | unchanged                                                       |
| `autocompletion.lua` | unchanged                                                       |

### Why `vim.lsp.config` instead of handlers

With newer Neovim + mason-lspconfig v2, `vim.lsp.config('server', {...})` is the correct way to set per-server config. It merges with the global `vim.lsp.config('*', {...})` and is applied before the server starts, regardless of how it was launched.

### Why split servers out of lspconfig

`lspconfig.lua` becomes stable boilerplate that rarely changes. `lspservers.lua` becomes the only file you touch when adding/removing/configuring a language server.

## Migration Steps

1. Delete `lint.lua` and `lspservers.lua`
2. Create new `lspservers.lua` — only thing that moves out of `lspconfig.lua` is the `ensure_installed` list and the per-server `vim.lsp.config(...)` calls:

```lua
local servers = {
  'bashls',
  'gopls',
  'yamlls',
  -- etc.
}

vim.lsp.config('gopls', {
  settings = { gopls = { buildFlags = { '-tags=integration' } } },
})

vim.lsp.config('yamlls', {
  settings = { yaml = { ... } },
})

vim.lsp.config('markdown_oxide', {
  capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
})

return servers
```

3. `lspconfig.lua` reads the server list from `lspservers.lua` and keeps everything else as-is (`signsMap`, `vim.diagnostic.config`, `LspAttach` keymaps):

```lua
local servers = require 'plugins.lsp.lspservers'

vim.lsp.config('*', {
  capabilities = vim.tbl_deep_extend('force',
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  ),
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_enable = true,
})

-- signsMap, vim.diagnostic.config, LspAttach autocmd unchanged
```

4. Remove the `handlers` table entirely
5. Add Tree-sitter autocmd for `yaml.*` sub-filetypes in `treesitter.lua`

## Open Questions

- Bring back linting? `eslint` LSP already covers JS/TS. `yamllint`, `tflint`, `hadolint` have no LSP equivalent so nvim-lint is the right tool for those if needed.
- Keep `markdown_oxide`? It requires `didChangeWatchedFiles.dynamicRegistration = true` as an extra capability — needs a `vim.lsp.config('markdown_oxide', {...})` entry to restore this.
