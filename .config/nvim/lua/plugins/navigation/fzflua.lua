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
        -- 1. `--no-ignore-vcs`: Tells `fd` to not respect version control ignore files (like .gitignore)
        -- 2. `--hidden`: Includes hidden files and directories (those starting with a dot, like .config, .circleci)
        -- 3. `--follow`: Follows symbolic links while searching
        -- 4. `--exclude .git`: Explicitly excludes the .git directory from searches
        -- 5. `--exclude node_modules`: Explicitly excludes the node_modules directory from searches
        -- 6. `--no-ignore`: Tells `fd` to not respect any ignore files (including .ignore, .fdignore, etc.)
        fd_opts = '--no-ignore-vcs --hidden --follow --exclude .git --exclude node_modules --no-ignore',
      },
      grep = {
        -- This line configures how ripgrep (rg) performs text searches in fzf-lua. Let's break down each flag:
        -- 1. `--hidden`: Searches hidden files and directories (those starting with a dot)
        -- 2. `--column`: Shows the column number where matches are found
        -- 3. `--line-number`: Shows the line number for each match
        -- 4. `--no-heading`: Displays results without grouping them by file
        -- 5. `--color=always`: Forces color output even when piping to another program
        -- 6. `--smart-case`: Case-insensitive search unless pattern contains uppercase
        -- 7. `--max-columns=512`: Only searches lines up to 512 columns wide
        -- 8. `-g '!.git'`: Excludes the .git directory from searches (glob pattern)
        -- 9. `-g '!node_modules'`: Excludes the node_modules directory
        -- 10. `--no-ignore`: Searches in all directories, even those normally ignored
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!.git' -g '!node_modules' -g '!build' -g '!dist' -g '!coverage' --no-ignore",
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
          -- ['shift-k'] = 'up',
          -- ['shift-j'] = 'down',
        },
      },
    }
    vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { desc = 'goto definition' })
    vim.keymap.set('n', 'gD', require('fzf-lua').lsp_declarations, { desc = 'goto declarations' }) -- WARN: This is not Goto Definition, this is Goto Declaration. For example, in C this would take you to the header.
    vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references, { desc = 'goto references' })
    vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = 'goto implementation' })

    vim.keymap.set('n', '<leader>D', require('fzf-lua').lsp_typedefs, { desc = 'type definition' })
    vim.keymap.set('n', '<leader>sd', require('fzf-lua').lsp_document_symbols, { desc = 'document symbols' })

    vim.keymap.set('n', '<leader>sb', require('fzf-lua').builtin, { desc = 'fzf builtin' })
    vim.keymap.set('n', '<leader>sB', require('fzf-lua').buffers, { desc = 'fzf builtin' })
    vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = 'fzf files' })
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'fzf grep' })
    vim.keymap.set('n', '<leader>sG', require('fzf-lua').git_status, { desc = 'fzf git status' })
    vim.keymap.set('n', '<leader>sc', require('fzf-lua').grep_curbuf, { desc = 'fzf current buffer' })
    vim.keymap.set('n', '<leader>sC', require('fzf-lua').commands, { desc = 'fzf current buffer' })
    vim.keymap.set('n', '<leader>sq', require('fzf-lua').quickfix, { desc = 'fzf quickfix' })
    vim.keymap.set('n', '<leader>se', require('fzf-lua').diagnostics_document, { desc = 'fzf diagnostics (current buffer)' })
    vim.keymap.set('n', '<leader>sE', require('fzf-lua').diagnostics_workspace, { desc = 'fzf diagnostics (workspace)' })
  end,
}
