return function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "json" }, -- list of language that will be disabled
    },
    indent = { enable = true },
    autopairs = { enable = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
  })

  local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
  ft_to_parser['javascript.jsx'] = "typescript" -- the someft filetype will use the python parser and queries.
  ft_to_parser['strato'] = "scala" -- the someft filetype will use the python parser and queries.
end
