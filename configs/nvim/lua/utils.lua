local M = {}

M.keymap = function(mode, key, command, opts)
  local default_opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, command, opts or default_opts)
end

M.buf_map = function(bufnr, mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or default_opts)
end

M.open_in_github = function()
  local file_dir = vim.fn.expand('%:h')
  local git_root = vim.fn.system('cd ' .. file_dir .. '; git rev-parse --show-toplevel | tr -d "\\n"')
  local file_path = vim.fn.expand('%:p'):gsub(git_root .. '/', '')
  local branch = vim.fn.system('git symbolic-ref --short -q HEAD | tr -d "\\n"')
  local git_remote = vim.fn.system('cd ' .. file_dir .. '; git remote get-url origin')
  local repo_path = string.match(git_remote, ':(.*)%.')
  local url = 'https://github.com/' .. repo_path .. '/blob/' .. branch .. '/' .. file_path
  local first_line = vim.fn.getpos("'<")[2]
  url = url .. '#L' .. first_line
  local last_line = vim.fn.getpos("'>")[2]
  if last_line ~= first_line then
    url = url .. '-L' .. last_line
  end
  vim.fn.system('open ' .. url)
end

return M
