-- Octo.nvim only exposes `next_thread`/`prev_thread` (]t/[t) scoped to the
-- currently open file's diff. These helpers extend that to cycle through
-- review threads across *all* changed files in the active review, jumping
-- to the next/previous file automatically once the current file's threads
-- are exhausted.
local M = {}

---@param threads octo.ReviewThread[]
---@param key "startLine"|"originalLine"
local function sort_threads(threads, key)
  table.sort(threads, function(a, b)
    return a[key] < b[key]
  end)
  return threads
end

local function current_path()
  local utils = require 'octo.utils'
  local bufnr = vim.api.nvim_get_current_buf()
  local _, path = utils.get_split_and_path(bufnr)
  return path
end

local function file_index(files, path)
  for i, f in ipairs(files) do
    if f.path == path then
      return i
    end
  end
  return nil
end

function M.next_thread_any_file()
  local reviews = require 'octo.reviews'
  local file_panel = require 'octo.reviews.file-panel'
  local utils = require 'octo.utils'

  local layout = reviews.get_current_layout()
  if not layout then
    utils.error 'No active review'
    return
  end

  local path = current_path()
  local current_line = vim.fn.line '.'

  -- 1. try to find a later thread in the current file
  if path then
    local candidate = math.huge
    for _, thread in ipairs(file_panel.threads_for_path(path)) do
      if thread.startLine > current_line and thread.startLine < candidate then
        candidate = thread.startLine
      end
    end
    if candidate < math.huge then
      vim.cmd(':' .. candidate)
      return
    end
  end

  -- 2. otherwise, scan subsequent files (in file-panel order) for threads
  local files = layout.files
  local start_idx = path and (file_index(files, path) or 0) + 1 or 1

  for i = start_idx, #files do
    local file = files[i]
    local threads = file_panel.threads_for_path(file.path)
    if #threads > 0 then
      sort_threads(threads, 'startLine')
      layout:set_current_file(file)
      vim.cmd(':' .. threads[1].startLine)
      return
    end
  end

  utils.info 'No more threads'
end

function M.prev_thread_any_file()
  local reviews = require 'octo.reviews'
  local file_panel = require 'octo.reviews.file-panel'
  local utils = require 'octo.utils'

  local layout = reviews.get_current_layout()
  if not layout then
    utils.error 'No active review'
    return
  end

  local path = current_path()
  local current_line = vim.fn.line '.'

  -- 1. try to find an earlier thread in the current file
  if path then
    local candidate = -1
    for _, thread in ipairs(file_panel.threads_for_path(path)) do
      if thread.originalLine < current_line and thread.originalLine > candidate then
        candidate = thread.originalLine
      end
    end
    if candidate > -1 then
      vim.cmd(':' .. candidate)
      return
    end
  end

  -- 2. otherwise, scan preceding files (in file-panel order) for threads
  local files = layout.files
  local start_idx = path and (file_index(files, path) or (#files + 1)) - 1 or #files

  for i = start_idx, 1, -1 do
    local file = files[i]
    local threads = file_panel.threads_for_path(file.path)
    if #threads > 0 then
      sort_threads(threads, 'originalLine')
      layout:set_current_file(file)
      vim.cmd(':' .. threads[#threads].originalLine)
      return
    end
  end

  utils.info 'No more threads'
end

return M
