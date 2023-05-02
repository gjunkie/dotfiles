return function()
  require('formatter').setup({
    logging = false,
    filetype = {
      javascript = {
          -- prettierd
         function()
            return {
              exe = "prettier",
              args = {vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
      },
      typescript = {
          -- prettierd
         function()
            return {
              exe = "prettier",
              args = {vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
      },
      ["javascript.tsx"] = {
          -- prettierd
         function()
            return {
              exe = "prettier",
              args = {vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
      },
      -- other formatters ...
    }
  })
end
