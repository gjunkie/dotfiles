return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = "󰌵",
          info = "",
          warn = "",
          error = "",
        },
        highlights = {
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          warn = "DiagnosticSignWarn",
          error = "DiagnosticSignError",
        },
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "●",
          deleted = "✖",
          renamed = "➜",
          untracked = "◆",
          ignored = "◌",
          unstaged = "○",
          staged = "✔",
          conflict = "⚠",
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_hidden = false,
        show_hidden_count = true,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        never_show = {
          ".DS_Store",
          ".cache",
        },
      },
      components = {
        diagnostics = function(config, node, state)
          local diag = state.diagnostics_lookup or {}
          local severity = diag[node:get_id()]
          if severity then
            return {
              text = config.symbols[severity],
              highlight = config.highlights[severity],
            }
          end
          return {}
        end,
      },
    },
  },
}
