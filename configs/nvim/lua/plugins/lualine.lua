return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  theme = "catppuccin-mocca",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "😄")
  end,
}
