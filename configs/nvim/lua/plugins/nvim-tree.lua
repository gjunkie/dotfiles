return {
  "kyazdani42/nvim-tree.lua",
  opts = {
    view = {
      width = 50,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    git = {
      enable = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
  },
  -- local keymap = require("utils").keymap
  -- keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>")
  -- keymap("n", "<Tab>", ":NvimTreeFindFileToggle<CR>")
  -- keymap("n", "<C-c>", ":NvimTreeClose<CR>")
}
