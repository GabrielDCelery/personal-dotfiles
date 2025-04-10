return {
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    local function recording_status()
      local recording_register = vim.fn.reg_recording()
      if recording_register == '' then
        return ''
      else
        return ' Recording @' .. recording_register
      end
    end
    -- catppuccin is not controlled via the theme integrations but here
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
      },
      sections = {
        lualine_x = {
          recording_status,
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    }
  end,
}
