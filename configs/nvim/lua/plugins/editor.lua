return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files Telescope",
    },
  },
  opts = {
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--glob", "!**/.git/*", "-L" },
      },
    },
  },
}
