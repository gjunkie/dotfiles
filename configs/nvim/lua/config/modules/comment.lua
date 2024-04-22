local M = {}

function M.min_indent(first, last)
  local min = vim.fn.indent(first)
  for i = first + 1, last do
    local indent = vim.fn.indent(i)
    if indent > 0 and indent < min then
      min = indent
    end
  end
  return min
end

function M.comment_delimiters()
  local delim = vim.split(vim.api.nvim_buf_get_option(0, "commentstring"), "%s*%%s%s*")
  if #delim == 0 then
    vim.api.nvim_err_writeln("Undefined comment delimiters. Please setlocal commentstring.")
    return { "", "" }
  elseif #delim < 2 then
    table.insert(delim, "")
  end
  return { vim.pesc(delim[1]), vim.pesc(delim[2]) }
end

function M.comment_out(first, last, lc, rc)
  local indent = M.min_indent(first, last)
  for lnum = first, last do
    local line = vim.fn.getline(lnum)
    local indented_line = string.gsub(
      line,
      "^(" .. string.rep("%s", indent) .. ")(.*)$",
      "%1" .. lc .. " %2" .. (rc ~= "" and " " .. rc or ""),
      1
    )
    vim.fn.setline(lnum, indented_line)
  end
end

function M.uncomment(first, last, lc, rc)
  for lnum = first, last do
    local line = vim.fn.getline(lnum)
    line = string.gsub(line, "%s*" .. rc .. "%s*$", "", 1)
    line = string.gsub(line, "^(%s*)" .. lc .. "%s?(.*)$", "%1%2", 1)
    vim.fn.setline(lnum, line)
  end
end

function M.toggle_comment(first, last)
  local lc, rc = unpack(M.comment_delimiters())
  if vim.fn.match(vim.fn.getline(first), "^%s*" .. lc) > -1 then
    M.uncomment(first, last, lc, rc)
  else
    M.comment_out(first, last, lc, rc)
  end
end

return M
