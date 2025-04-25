local M = {}

function M.open_in_github()
  -- Get the current file's path
  local current_file = vim.fn.expand("%:p")

  -- Get the repository URL using git
  local repo_url = vim.fn.system("git config --get remote.origin.url")

  -- If the current file is not in a Git repo, display an error
  if vim.fn.empty(repo_url) == 1 then
    print("This file is not inside a Git repository.")
    return
  end

  -- Trim any leading or trailing whitespace from the repo_url
  repo_url = repo_url:gsub("^%s*(.-)%s*$", "%1")

  -- Clean up the repository URL: remove .git if present (after getting the URL)
  repo_url = repo_url:gsub("%.git$", "")
  print("Repository URL: " .. repo_url)

  -- Get the relative file path within the repository
  local relative_path = vim.fn.expand("%:p:~:.")

  -- Extract the domain from the repo_url (handles both HTTPS and SSH)
  local domain = repo_url:match("https?://([^/]+)") -- Extracts the domain part (e.g., github.mydomain.com or github.com)

  -- Check if we successfully got the domain
  if not domain then
    print("Error: Unable to parse the repository URL.")
    return
  end

  -- Ensure the URL starts with "https://"
  if not repo_url:match("^https://") then
    repo_url = "https://" .. repo_url
  end

  -- Add the file's relative path and the blob/main/ part to the URL
  local github_url = repo_url .. "/blob/main/" .. relative_path

  -- Open the GitHub URL in the default web browser
  -- vim.fn.system("xdg-open " .. github_url) -- For Linux
  vim.fn.system("open " .. github_url) -- For macOS
  -- vim.fn.system("start " .. github_url)  -- For Windows
end

return M
