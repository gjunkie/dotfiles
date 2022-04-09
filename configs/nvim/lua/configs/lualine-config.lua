return function()
  require("lualine").setup({
    options = {
      disabled_filetypes = {'NvimTree'},
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  })
end
