return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = "catppuccin-macchiato"
    return opts
  end,
}
