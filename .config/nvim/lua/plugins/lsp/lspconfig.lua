local language_servers = require 'plugins.lsp.lspservers'

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' }, -- Load only when file is opened
  dependencies = {
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    {
      'williamboman/mason.nvim', 
      version = 'v1.8.3',
      opts = {}
    },
    {
      'williamboman/mason-lspconfig.nvim',
      version = 'v1.32.0',
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = {
        ensure_installed = language_servers,

        auto_update = false, -- will not auto-update, run MasonToolsInstall or MasonToolsUpdate
        run_on_start = true, -- will install tools on startup
      },
    },
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local signsMap = {
      [vim.diagnostic.severity.ERROR] = { message = 'Error', icon = ' ' },
      [vim.diagnostic.severity.WARN] = { message = 'Warn', icon = ' ' },
      [vim.diagnostic.severity.HINT] = { message = 'Hint', icon = '󰌵 ' },
      [vim.diagnostic.severity.INFO] = { message = 'Info', icon = ' ' },
    }

    vim.diagnostic.config {
      virtual_text = {
        prefix = function(diagnostic)
          for k, v in pairs(signsMap) do
            if diagnostic.severity == k then
              return v.icon
            end
          end
          return '●'
        end,
        spacing = 4,
        source = true,
        wrap = true, -- Enable wrapping for virtual text
        format = function(diagnostic)
          return vim.split(diagnostic.message, '\n')[1]
        end,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        wrap = true,
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
    for _, v in pairs(signsMap) do
      local hl = 'DiagnosticSign' .. v.message
      vim.fn.sign_define(hl, { text = v.icon, texthl = hl, numhl = hl })
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
        -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Find references for the word under your cursor.
        -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

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
        vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = 'Rename' })
        -- vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = 'Show details' })

        -- map('<leader>K', vim.lsp.buf.hover, 'Show Details')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        --  TODO: figure out what to do with this
        -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local does_buffer_support_document_highlight = client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)

        if does_buffer_support_document_highlight then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

          -- if the cursror stays still then it will highglight all references of the symbol under the cursor
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          -- when moving the cursor clear the previously highligted references
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          -- when the lsp client detaches clear all existing highlights, also remove highligthing autocommand from that buffer
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

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local defaultLspCapabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

    require('mason-lspconfig').setup {
      automatic_enable = true,
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
        ['volar'] = function()
          require('lspconfig').volar.setup {
            capabilities = defaultLspCapabilities,
            filetypes = {
              'typescript',
              'javascript',
              'javascriptreact',
              'typescriptreact',
              'vue',
              'json',
            },
            init_options = {
              typescript = {
                -- would use the following if we had a global installation of typescript
                -- tsdk = vim.fn.expand '$HOME/node_modules/typescript/lib',
                -- this is the installation of the typescrpt language server that mason-tool-installer installs
                tsdk = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
              },
              -- additional Volar settings
              languageFeatures = {
                implementation = true, -- Go to implementation support
                references = true, -- Find references support
                definition = true, -- Go to definition support
                typeDefinition = true, -- Go to type definition support
                callHierarchy = true,
                hover = true,
                rename = true,
                renameFileRefactoring = true,
                signatureHelp = true,
                codeAction = true,
                workspaceSymbol = true,
                completion = {
                  defaultTagNameCase = 'both',
                  defaultAttrNameCase = 'kebabCase',
                },
              },
            },
            before_init = function(params, config)
              local root_dir = params.root_dir
              local lib_path = vim.fs.find('node_modules/typescript/lib', { path = root_dir, upward = true })[1]
              if lib_path then
                config.init_options.typescript.tsdk = lib_path
              end
            end,
          }
        end,
      },
    }
  end,
}
