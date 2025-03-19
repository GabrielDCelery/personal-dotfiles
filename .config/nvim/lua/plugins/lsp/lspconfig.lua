return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = {
        spacing = 4,
        source = true,
        wrap = true, -- Enable wrapping for virtual text
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
        wrap_at = 80, -- Wrap floating window text at 80 characters
        max_width = 100, -- Maximum width of diagnostic floating window
      },
    }

    -- Show diagnostic symbols in the sign column
    local signs = { Error = ' ', Warn = ' ', Hint = '󰌵 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        --  TODO: figure out what to do with this
        -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        --  TODO: figure out what to do with this
        -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        -- --  Similar to document symbols, except searches over your entire project.
        --  TODO: figure out what to do with this
        -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        --  TODO: figure out what to do with this
        -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- map('<leader>K', vim.lsp.buf.hover, 'Show Details')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        --  TODO: figure out what to do with this
        -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local does_buffer_support_document_highlight = client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)

        if does_buffer_support_document_highlight then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        --
        -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        --   map('<leader>th', function()
        --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        --   end, '[T]oggle Inlay [H]ints')
        -- end
      end,
    })

    local language_serves = {
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
      'templ',
      'terraformls',
      'ts_ls',
      'yamlls',
    }

    local formatters = {
      'black', -- python
      'isort', -- python
      'goimports', -- go
      -- 'jq', -- json
      'markdownlint', -- markdown
      'prettier',
      'prettierd',
      'stylua', -- lua formatter
      -- 'yamlfmt', -- yaml
      'yq', -- json, yaml xml formatter
    }

    local linters = {
      'eslint_d',
      'tflint',
      'jsonlint',
      'yamllint',
      'hadolint',
    }

    vim.list_extend(language_serves, formatters)
    vim.list_extend(language_serves, linters)

    require('mason-tool-installer').setup { ensure_installed = language_serves }

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local defaultLspCapabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

    require('mason-lspconfig').setup {
      -- Using mason-tool-installer therefore setting automatic_installation to false and leaving ensure_installed empty
      ---@type boolean
      automatic_installation = false,
      ---@type string[]
      ensure_installed = {},
      -- See `:h mason-lspconfig.setup_handlers()`
      ---@type table<string, fun(server_name: string)>?
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = defaultLspCapabilities,
          }
        end,
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup {
            capabilities = vim.tbl_deep_extend('force', defaultLspCapabilities, {}),
            settings = {
              Lua = {
                completion = {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          }
        end,
        ['markdown_oxide'] = function()
          require('lspconfig').markdown_oxide.setup {
            capabilities = vim.tbl_deep_extend('force', defaultLspCapabilities, {
              workspace = {
                didChangeWatchedFiles = {
                  dynamicRegistration = true,
                },
              },
            }),
          }
        end,
      },
    }
  end,
}
