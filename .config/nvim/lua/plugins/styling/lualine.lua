return {
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    local function recording_status()
      local recording_register = vim.fn.reg_recording()
      if recording_register ~= '' then
        return ' Recording @' .. recording_register
      end
      return ''
    end

    -- catppuccin is not controlled via the theme integrations but here
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
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
          },
        },
        lualine_x = {
          recording_status,
          'encoding',
          'fileformat',
          'filetype',
          'lsp_status',
        },
      },
    }
  end,
}
