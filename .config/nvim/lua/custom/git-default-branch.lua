-- resolves the repo's default branch, preferring `main` over `master`
local M = {}

function M.get()
  vim.fn.system 'git rev-parse --verify --quiet refs/heads/main'
  if vim.v.shell_error == 0 then
    return 'main'
  end

  vim.fn.system 'git rev-parse --verify --quiet refs/heads/master'
  if vim.v.shell_error == 0 then
    return 'master'
  end

  return 'main'
end

return M
