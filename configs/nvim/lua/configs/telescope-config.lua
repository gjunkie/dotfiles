return function()
  local actions = require('telescope.actions')
  local utils = require('telescope.utils')

  local M = {}

  function M.nvim_config()
    require('telescope.builtin').file_browser {
      prompt_title = '\\ Neovim Config /',
      shorten_path = false,
      cwd = '~/.config/nvim/',
      width = .25,
      layout_strategy = 'horizontal',
      layout_config = {
        preview_width = .65,
      }
    }
  end

  return M
end
