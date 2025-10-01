return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
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
          -- 'thumbs.db',
        },
        never_show = {
          ".DS_Store",
          ".cache",
        },
      },
    },
  },
}
