-- nvim-navic shows an LSP-powered breadcrumb (file > class > function) in the winbar
-- https://github.com/SmiteshP/nvim-navic

return {
  'SmiteshP/nvim-navic',
  lazy = true, -- loaded on demand via require() from lspconfig's LspAttach handler
  init = function()
    vim.g.navic_silence = true -- don't print anything if navic.attach() is called on an unsupported buffer
  end,
  opts = {
    highlight = true,
    separator = '  ',
    depth_limit = 5,
  },
  config = function(_, opts)
    require('nvim-navic').setup(opts)

    -- show the breadcrumb in the winbar of every normal window; buffers without
    -- an attached/ready navic client (e.g. neo-tree, terminals) just render empty
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

    -- grey out the breadcrumb (icons + text + separators) so it doesn't compete
    -- visually with the code; linking to Comment keeps it in sync with the theme
    local navic_highlight_groups = {
      'NavicText',
      'NavicSeparator',
      'NavicIconsFile',
      'NavicIconsModule',
      'NavicIconsNamespace',
      'NavicIconsPackage',
      'NavicIconsClass',
      'NavicIconsMethod',
      'NavicIconsProperty',
      'NavicIconsField',
      'NavicIconsConstructor',
      'NavicIconsEnum',
      'NavicIconsInterface',
      'NavicIconsFunction',
      'NavicIconsVariable',
      'NavicIconsConstant',
      'NavicIconsString',
      'NavicIconsNumber',
      'NavicIconsBoolean',
      'NavicIconsArray',
      'NavicIconsObject',
      'NavicIconsKey',
      'NavicIconsNull',
      'NavicIconsEnumMember',
      'NavicIconsStruct',
      'NavicIconsEvent',
      'NavicIconsOperator',
      'NavicIconsTypeParameter',
    }

    local function grey_out_navic()
      for _, group in ipairs(navic_highlight_groups) do
        vim.api.nvim_set_hl(0, group, { link = 'Comment' })
      end
    end

    grey_out_navic()
    -- colorscheme changes clear custom links, so re-apply them afterwards
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('navic-greyed-out', { clear = true }),
      callback = grey_out_navic,
    })
  end,
}
