local M = {}

-- add custom file types
function M.init()
  -- Add filetype detection for Helm templates
  vim.filetype.add {
    pattern = {
      ['.*%.yaml%.tpl'] = 'helm',
      ['.*%.yml%.tpl'] = 'helm',
      ['.*%.helm%.yaml'] = 'helm',
      ['.*%.helm%.yml'] = 'helm',
      ['.*%/templates/.*%.yaml'] = 'helm',
      ['.*%/templates/.*%.yml'] = 'helm',
    },
  }

  vim.filetype.add {
    pattern = {
      ['.*%.vue'] = 'vue',
    },
  }
end

return M
