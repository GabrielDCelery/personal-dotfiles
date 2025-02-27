local M = {}

function M.init()
  vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.json',
    callback = function()
      local max_filesize_in_kbytes = 100 * 1024 -- 100 KB
      local bufnr = vim.api.nvim_get_current_buf()
      local buf_path = vim.api.nvim_buf_get_name(bufnr)
      local ok, stats = pcall(vim.uv.fs_stat, buf_path)
      if ok and stats and stats.size > max_filesize_in_kbytes then
        vim.cmd '%!jq .'
      end
    end,
  })
end

return M
