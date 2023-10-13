local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
    'json',
    'scss',
    'less',
  }
}
