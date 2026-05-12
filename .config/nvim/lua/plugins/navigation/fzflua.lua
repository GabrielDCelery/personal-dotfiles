return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  -- opts = {},
  config = function()
    require('fzf-lua').setup {
      winopts = {
        height = 0.95, -- window height
        width = 0.90, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
      },
      files = {
        -- control how file searching works in fzf-lua through these flags:
        -- 1. `--hidden`: Includes hidden files and directories (those starting with a dot, like .config, .circleci)
        -- 2. `--follow`: Follows symbolic links while searching
        -- 3. `--exclude .git`: Explicitly excludes the .git directory from searches
        -- 4. `--exclude '*lock*'`: Excludes lockfiles (package-lock.json, pnpm-lock.yaml, etc.)
        -- Note: Respects .gitignore to exclude node_modules, build, dist, .env, etc.
        fd_opts = '--hidden --follow --exclude .git --exclude *lock*',
      },
      grep = {
        -- This line configures how ripgrep (rg) performs text searches in fzf-lua. Let's break down each flag:
        -- 1. `--hidden`: Searches hidden files and directories (those starting with a dot, like .circleci)
        -- 2. `--column`: Shows the column number where matches are found
        -- 3. `--line-number`: Shows the line number for each match
        -- 4. `--no-heading`: Displays results without grouping them by file
        -- 5. `--color=always`: Forces color output even when piping to another program
        -- 6. `--smart-case`: Case-insensitive search unless pattern contains uppercase
        -- 7. `--max-columns=512`: Only searches lines up to 512 columns wide
        -- 8. `-g '!.git'`: Excludes the .git directory from searches
        -- 9. `-g '!*lock*'`: Excludes lockfiles (package-lock.json, pnpm-lock.yaml, yarn.lock, poetry.lock, uv.lock, etc.)
        -- Note: Respects .gitignore to exclude node_modules, build, dist, .env, etc.
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!*lock*'",
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
          -- ['shift-k'] = 'up',
          -- ['shift-j'] = 'down',
        },
      },
    }
    -- Jump to where a symbol is defined — for a function this is the function body, for an
    -- interface this is the interface itself. Use <C-t> to come back.
    vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { desc = 'goto definition' })

    -- Jump to the declaration (the interface/signature), not the implementation.
    -- In C/C++ this is the header file. In Go/TypeScript this is the interface or type signature.
    -- Use this when you want the contract, not the code behind it.
    vim.keymap.set('n', 'gD', require('fzf-lua').lsp_declarations, { desc = 'goto declaration' })

    -- Find every place this symbol is used across the project. Opens results in fzf.
    -- Use this when you want to understand the impact of changing something.
    vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references, { desc = 'goto references' })

    -- Jump to the concrete struct/class that implements an interface — the actual code that runs.
    -- Use this when you're on an interface type and want to find what satisfies it.
    -- e.g. sitting on io.Reader → gI takes you to os.File, not the io.Reader interface.
    vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = 'goto implementation' })

    -- Jump to the type definition of the symbol under the cursor — not where the variable was
    -- declared, but what type it is. Use this to discover all fields on a struct, interface,
    -- or object type when you want to know what keys/methods are available.
    vim.keymap.set('n', '<leader>D', require('fzf-lua').lsp_typedefs, { desc = 'type definition' })
    vim.keymap.set('n', '<leader>sd', require('fzf-lua').lsp_document_symbols, { desc = 'document symbols' })

    vim.keymap.set('n', '<leader>sb', require('fzf-lua').builtin, { desc = 'fzf builtin' })
    vim.keymap.set('n', '<leader>sB', require('fzf-lua').buffers, { desc = 'fzf buffers' })
    vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = 'fzf files' })
    vim.keymap.set('n', '<leader>sn', function()
      require('fzf-lua').files { cwd = vim.fn.expand '%:h' }
    end, { desc = 'fzf files in current dir' })
    vim.keymap.set('n', '<leader>sF', function()
      require('fzf-lua').files { fd_opts = '--hidden --no-ignore --follow --exclude .git' }
    end, { desc = 'fzf files (all, incl gitignored)' })
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'fzf grep' })
    vim.keymap.set('n', '<leader>sG', function()
      require('fzf-lua').live_grep {
        rg_opts = "--hidden --no-ignore --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git'",
      }
    end, { desc = 'fzf grep (all, incl gitignored)' })
    vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'fzf git status' })
    vim.keymap.set('n', '<leader>sc', require('fzf-lua').grep_curbuf, { desc = 'fzf current buffer' })
    vim.keymap.set('n', '<leader>sC', require('fzf-lua').commands, { desc = 'fzf current buffer' })
    vim.keymap.set('n', '<leader>sq', require('fzf-lua').quickfix, { desc = 'fzf quickfix' })
    vim.keymap.set('n', '<leader>se', require('fzf-lua').diagnostics_document, { desc = 'fzf diagnostics (current buffer)' })
    vim.keymap.set('n', '<leader>sE', require('fzf-lua').diagnostics_workspace, { desc = 'fzf diagnostics (workspace)' })
  end,
}
