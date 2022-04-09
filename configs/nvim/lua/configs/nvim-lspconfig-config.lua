return function()
  local nvim_lsp = require('lspconfig')

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  -- nvim_lsp.tsserver.setup {
   -- capabilities = capabilities
  -- }

  -- nvim_lsp.metals.setup{}

  local on_attach = function(client)
    vim.api.nvim_command [[command! Format execute 'lua vim.lsp.buf.formatting()']]
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> Prettier]]
      vim.api.nvim_command [[augroup END]]
    end
  end

  vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
  vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

  local border = {
    {"╔", "FloatBorder"},
    {"═", "FloatBorder"},
    {"╗", "FloatBorder"},
    {"║", "FloatBorder"},
    {"╝", "FloatBorder"},
    {"═", "FloatBorder"},
    {"╚", "FloatBorder"},
    {"║", "FloatBorder"},
  }

  -- LSP settings (for overriding per client)
  local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
    ["textDocument/diagnostic"] =  vim.lsp.with(vim.lsp.handlers.diagnostic, {border = border}),
  }

  nvim_lsp.flow.setup{
    handlers = handlers,
    capabilities = capabilities,
    on_attach = on_attach,
  }

  nvim_lsp.tsserver.setup {
    handlers = handlers,
    on_attach = on_attach,
  }

  nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    args = {"%filename", "%relativepath", "%file", "%filepath", "%dirname"},
    filetypes = { 'javascript.jsx', 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'pandoc' },
    init_options = {
      linters = {
        eslint = {
          sourceName = 'eslint_d',
          command = 'eslint_d',
          debounce = 100,
          args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[eslint] ${message} [${ruleId}]',
            security = 'severity',
          },
          securities = { ['1'] = 'warning', ['2'] = 'error' },
          rootPatterns = {
            '.eslintrc',
            '.eslintrc.cjs',
            '.eslintrc.js',
            '.eslintrc.json',
            '.eslintrc.yaml',
            '.eslintrc.yml',
          },
        },
      },
      filetypes = {
        ['javascript.jsx'] = 'eslint',
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
      },
      formatters = {
        eslint = {
          command = 'eslint_d',
          rootPatterns = {
            '.eslintrc',
            '.eslintrc.cjs',
            '.eslintrc.js',
            '.eslintrc.json',
            '.eslintrc.yaml',
            '.eslintrc.yml',
          },
          args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        },
        prettier = {
          command = 'prettier',
          args = { '--stdin', '--stdin-filepath', '%filename' },
          sourceName = 'prettier',
          rootPatterns = {
            '.prettierrc',
            '.prettierrc.json',
            '.prettierrc.toml',
            '.prettierrc.json',
            '.prettierrc.yml',
            '.prettierrc.yaml',
            '.prettierrc.json5',
            '.prettierrc.js',
            '.prettierrc.cjs',
            'prettier.config.js',
            'prettier.config.cjs',
          },
        }
      },
      formatFiletypes = {
        css = 'prettier',
        ['javascript.jsx'] = 'prettier',
        javascript = 'prettier',
        javascriptreact = 'prettier',
        json = 'prettier',
        scss = 'prettier',
        less = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier',
        json = 'prettier',
      }
    }
  }

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
end
