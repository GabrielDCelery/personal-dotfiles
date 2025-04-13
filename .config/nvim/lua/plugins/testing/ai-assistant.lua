return {
  'yetone/avante.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown' },
      },
      ft = { 'markdown' },
    },
  },
  event = 'VeryLazy',
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = 'claude', -- the default provider being used

    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-3-5-sonnet-20241022',
      timeout = 30000, -- timeout in milliseconds
      temperature = 0, -- adjust if needed
      max_tokens = 4096,
      -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    },
    openai = {
      endpoint = 'https://api.openai.com/v1',
      model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
      timeout = 30000, -- timeout in milliseconds
      temperature = 0, -- adjust if needed
      max_tokens = 4096,
      -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
      enable_token_counting = true,
      enable_cursor_planning_mode = true,
      enable_claude_text_editor_tool_mode = true,
    },
    file_selector = {
      provider = 'telescope',
      provider_opts = {},
    },
    disabled_tools = {
      'python', -- do not want code execution capabilities
      'create_file',
      'rename_file',
      'delete_file',
      'create_dir',
      'rename_dir',
      'delete_dir',

      -- 'list_files',
      -- 'search_files',
      -- 'read_file',
      -- 'grep',
      -- 'read_defitions',
      -- 'git diff',
      -- 'git commit',
    },
    windows = {
      position = 'right',
      sidebar_header = {
        align = 'left',
        rounded = false,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
}
