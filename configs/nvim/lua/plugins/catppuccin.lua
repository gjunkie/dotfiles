return {
  "catppuccin/nvim",
  options = {
    theme = "catppuccin",
    -- ... the rest of your lualine config
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    lualine = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
}
