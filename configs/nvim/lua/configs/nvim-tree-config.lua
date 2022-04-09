return function()
  require("nvim-tree").setup({
    view = {
      width = 50,
      height = 30,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
        },
      },
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
  })
  local keymap = require("utils").keymap
  keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>")
  keymap("n", "<Tab>", ":NvimTreeFindFileToggle<CR>")
  keymap("n", "<C-c>", ":NvimTreeClose<CR>")
end
