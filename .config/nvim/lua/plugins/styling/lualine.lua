return {
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons',
    'catpuccin/nvim',
  },
  config = function()
    local function recording_status()
      local recording_register = vim.fn.reg_recording()
      if recording_register ~= '' then
        return ' Recording @' .. recording_register
      end
      return ''
    end

    local function harpoon_status()
      local ok, harpoon = pcall(require, 'harpoon')
      if not ok then
        return ''
      end
      local list = harpoon:list()
      local current = vim.fn.fnamemodify(vim.fn.expand '%:p', ':~:.')
      for i, item in ipairs(list.items) do
        if item.value == current then
          return '󰀱 ' .. i
        end
      end
      return ''
    end

    local function get_formatter()
      local conform = require 'conform'
      local formatters = conform.list_formatters(0)
      -- check if the array like table of formatters is empty
      if #formatters == 0 then
        return ''
      end
      local names = vim.tbl_map(function(f)
        return f.name
      end, formatters)
      return '󰉢 ' .. table.concat(names, ', ')
    end

    -- catppuccin is not controlled via the theme integrations but here
    require('lualine').setup {
      options = {
        theme = 'catppuccin-mocha',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            shorting_target = 50,
            symbols = {
              modified = ' ', -- Text to show when the file is modified.
              readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = ' ', -- Text to show for newly created file before first write
            },
            color = function()
              if vim.bo.modified then
                return { fg = '#fab387' }
              end
            end,
          },
          {
            harpoon_status,
            color = { fg = '#f5c2e7' },
          },
        },
        lualine_x = {
          {
            recording_status,
            color = { fg = '#f38ba8' },
          },
          'filetype',
          get_formatter,
          {
            'lsp_status',
            icon = '', -- f013
            symbols = {
              -- Standard unicode symbols to cycle through for LSP progress:
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              -- Standard unicode symbol for when LSP is done:
              done = '✓',
              -- Delimiter inserted between LSP names:
              separator = ' ',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
            color = function()
              if vim.lsp.status() ~= '' then
                return { fg = '#fab387' }
              end
            end,
          },
        },
      },
    }
  end,
}
