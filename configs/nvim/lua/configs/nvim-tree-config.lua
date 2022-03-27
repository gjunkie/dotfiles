return function()
  require("nvim-tree").setup({})
  local keymap = require("utils").keymap
  keymap("n", "<S-Tab>", ":NvimTreeToggle<CR>")
  keymap("n", "<Tab>", ":NvimTreeFindFile<CR>")
end
