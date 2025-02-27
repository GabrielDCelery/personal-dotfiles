-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  -- This is ran whenever treesitter is installed or updated, the below command will also make sure the language dependencies get updated as well
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    -- Specify the languages that we want to get treeitter installed
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'go',
      'html',
      'javascript',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'nix',
      'query',
      'typescript',
      'terraform',
      'xml',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    sync_install = false,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      disable = function(lang, buf)
        local max_filesize_in_kbytes = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize_in_kbytes then
          return true
        end
      end,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ii'] = '@conditional.inner',
          ['ai'] = '@conditional.outer',
          ['il'] = '@loop.inner',
          ['al'] = '@loop.outer',
          ['at'] = '@comment.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          -- ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          -- ['<leader>A'] = '@parameter.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          -- [']f'] = '@function.outer',
          [']af'] = '@function.outer',
          [']if'] = '@function.inner',
          [']ic'] = '@class.inner',
          [']al'] = '@loop.outer',
          [']ac'] = '@class.outer',
          [']il'] = '@loop.inner',
          [']ai'] = '@conditional.outer',
          [']ii'] = '@conditional.inner',
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
          -- [']o'] = '@loop.*',
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          -- [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
          -- [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
        },
        goto_next_end = {
          [']aF'] = '@function.outer',
          [']iF'] = '@function.inner',
          [']iC'] = '@class.inner',
          [']aL'] = '@loop.outer',
          [']aC'] = '@class.outer',
          [']iL'] = '@loop.inner',
          [']aI'] = '@conditional.outer',
          [']iI'] = '@conditional.inner',
        },
        goto_previous_start = {
          ['[af'] = '@function.outer',
          ['[if'] = '@function.inner',
          ['[ic'] = '@class.inner',
          ['[al'] = '@loop.outer',
          ['[ac'] = '@class.outer',
          ['[il'] = '@loop.inner',
          ['[ai'] = '@conditional.outer',
          ['[ii'] = '@conditional.inner',
        },
        goto_previous_end = {
          ['[aF'] = '@function.outer',
          ['[iF'] = '@function.inner',
          ['[iC'] = '@class.inner',
          ['[aL'] = '@loop.outer',
          ['[aC'] = '@class.outer',
          ['[iL'] = '@loop.inner',
          ['[aI'] = '@conditional.outer',
          ['[iI'] = '@conditional.inner',
        },
      },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
